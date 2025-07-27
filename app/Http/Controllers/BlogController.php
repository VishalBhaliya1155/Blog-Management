<?php


namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Blog;

class BlogController extends Controller
{

 public function index(Request $request)
{
    try {
        $userId = $request->user()->id;

        $perPage = (int) $request->get('per_page', 10);
        $perPage = $perPage > 500 ? 500 : $perPage;
        $page = max((int) $request->get('page', 1), 1);
        $sort = $request->get('sort');
        $search = $request->search;

        $query = Blog::query()
            ->with(['user:id,name,email'])
            ->withCount('likes')
            ->withExists(['likes as liked_by_user' => function ($q) use ($userId) {
                $q->where('user_id', $userId);
            }])
            ->when($request->filled('search'), function ($q) use ($search) {
                $q->where(function ($sub) use ($search) {
                    $sub->where('title', 'like', "%{$search}%")
                        ->orWhere('description', 'like', "%{$search}%");
                });
            })
           ->orWhereHas('user',function($q) use ($request)
            {
                 $s = $request->search;
                    $q->where(function ($sub) use ($s) {
                        $sub->where('name', 'like', "%{$s}%")
                            ->orWhere('name', 'like', "%{$s}%");
                    });
            });

        if ($sort === 'most_liked') {
            $query->orderByDesc('likes_count')->orderByDesc('created_at');
        } else {
            $query->orderByDesc('created_at');
        }

        $paginator = $query->paginate($perPage, ['*'], 'page', $page);

        $paginator->getCollection()->transform(function ($blog) {
            $blog->image = $blog->image ? url($blog->image) : null;
            return $blog;
        });

        return response()->json([
            'status' => true,
            'message' => 'Blogs fetched successfully',
            'data' => [
                'blogs' => $paginator->items(),
                'current_page' => $paginator->currentPage(),
                'total_rows' => $paginator->total(),
                'total_pages' => $paginator->lastPage(),
                'current_page_rows' => $paginator->count(),
            ]
        ]);
    } catch (\Exception $e) {
        return response()->json([
            'status' => false,
            'message' => 'Something went wrong while fetching blogs.',
            'error' => $e->getMessage()
        ], 500);
    }
}




    public function store(Request $request)
    {
        try {
            $request->validate([
                'title' => 'required|string|max:255',
                'description' => 'required|string',
                'image' => 'required|file|mimes:jpg,jpeg,png|max:20480',
                [
                    'image.max' => 'The image size must not exceed 20MB.',
                    'image.mimes' => 'Only JPG, JPEG, and PNG files are allowed.',
                ]
            ]);

            $path = null;

            if ($request->File('image')) {
                $file = $request->file('image');
               
                $filename =$file->getClientOriginalName();
                $file->move(public_path('uploads'), $filename);
                $path = 'uploads/' . $filename;
            }

            $blog = Blog::create([
                'title' => $request->title,
                'description' => $request->description,
                'image' => $path,
                'user_id' => auth()->id(),
            ]);

            return response()->json([
                'status' => true,
                'message' => 'Blog created successfully!',
                'data' => $blog,
                'image_url' => url($path),
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status' => false,
                'message' => 'Something went wrong!',
                'error' => $e->getMessage()
            ], 500);
        }
    }


    public function toggleLike(Request $request)
    {
        try {
            $request->validate([
                'blog_id' => 'required|integer'
            ]);

            $blog = Blog::find($request->blog_id);

            if (!$blog) {
                return response()->json(['message' => 'Blog not found'], 404);
            }

             $userId = $request->input('user_id', auth()->id());
            $like = $blog->likes()->where('user_id', $userId)->first();

            if ($like) {
                $like->delete();
                return response()->json(['message' => 'Unliked']);
            } else {
                $blog->likes()->create(['user_id' => $userId]);
                return response()->json(['message' => 'Liked']);
            }
        } catch (\Exception $e) {
            return response()->json([
                'status' => false,
                'message' => 'Something went wrong!',
                'error' => $e->getMessage()
            ], 500);
        }
    }




    public function update(Request $request, Blog $blog)
    {
        try {
            $blog = Blog::find($request->blog_id);
            if (!$blog) {
                return response()->json(['message' => 'Blog not found'], 404);
            }
            $userId = $request->input('user_id', auth()->id());
            if ($blog->user_id != $userId) {
                return response()->json(['message' => 'Unauthorized'], 403);
            }

            $request->validate([
                'title'       => 'required|string|max:255',
                'description' => 'required|string',
                'image' => 'required|file|mimes:jpg,jpeg,png',
                [
                    'image.max' => 'The image size must not exceed 20MB.',
                    'image.mimes' => 'Only JPG, JPEG, and PNG files are allowed.',
                ]
            ]);

            $blog->update($request->only(['title', 'description']));

            if ($request->hasFile('image')) {
                if ($blog->image && file_exists(public_path($blog->image))) {
                    unlink(public_path($blog->image));
                }

                $file = $request->file('image');
                $filename = $file->getClientOriginalName();
                $file->move(public_path('uploads'), $filename);
                $blog->image = 'uploads/' . $filename;
                $blog->save();
            }

            return response()->json([
                'message'    => 'Blog updated successfully!',
                'data'       => $blog,
                'image_url'  => $blog->image ? url($blog->image) : null
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status' => false,
                'message' => 'Something went wrong!',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    public function destroy(Request $request, Blog $blog)
    {
        try {
            $request->validate(['blog_id' => 'required|integer']);
            $blog = Blog::find($request->blog_id);

            if (!$blog) {
                return response()->json(['message' => 'Blog not found'], 404);
            }

            $userId = $request->input('user_id', auth()->id());
            if ($blog->user_id != $userId) {
                return response()->json(['message' => 'Unauthorized'], 403);
            }

            $blog->delete();
            return response()->json(['message' => 'Deleted successfully']);
        } catch (\Exception $e) {
            return response()->json([
                'status' => false,
                'message' => 'Something went wrong!',
                'error' => $e->getMessage()
            ], 500);
        }
    }
}
