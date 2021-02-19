<?php

namespace App\Http\Controllers\Admin\Parenting;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use Auth;
use App\Models\ParentingTopic;
use App\Models\ParentingTopicCategory;
use App\Models\ParentingTopicStatus;
use Illuminate\Support\Facades\Storage;


class TopicsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $topics = ParentingTopic::all()->sortByDesc('id');
        return view('admin.parenting.topics.index', [
                            'topics' => $topics
                ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categories = ParentingTopicCategory::all();
        $statuses = ParentingTopicStatus::all();

        return view('admin.parenting.topics.create', [
                                'categories' => $categories,
                                'statuses' => $statuses
                        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $topic = new ParentingTopic;
        $topic->parenting_topic_status_id = $request->status;
        $topic->parenting_topic_category_id = $request->category;
        $topic->user_id = Auth::id();
        $topic->title = $request->title;
        $topic->topic = $request->topic;

        $image = $request->file('image');
        $image_new_name = $request->title.'.'.$image->getClientOriginalExtension();
        Storage::disk('topics')->putFileAs('/', $image, $image_new_name);
        $topic->image = '/app/topics/'.$image_new_name;

        $topic-> save();

        session()->flash('message', 'Topic Created Successfully');
        return redirect()->route('admin_parenting_topics_show', [$topic->id]);

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $topic = ParentingTopic::findOrFail($id);

        return view('admin.parenting.topics.show', [
                            'topic' => $topic
                    ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $topic = ParentingTopic::findOrFail($id);
        $categories = ParentingTopicCategory::all();
        $statuses = ParentingTopicStatus::all();

        return view('admin.parenting.topics.edit', [
                    'topic' => $topic,
                    'categories' => $categories,
                    'statuses' => $statuses,
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $topic = ParentingTopic::findOrFail($id);
        $topic->parenting_topic_status_id = $request->status;
        $topic->parenting_topic_category_id = $request->category;
        $topic->user_id = Auth::id();
        $topic->title = $request->title;
        $topic->topic = $request->topic;

        if(!empty($request->file('image'))){
            $image = $request->file('image');
            $image_new_name = $request->title.'.'.$image->getClientOriginalExtension();
            Storage::disk('topics')->putFileAs('/', $image, $image_new_name);
            $topic->image = '/app/topics/'.$image_new_name;
        }

        $topic-> update();

        session()->flash('message', 'Topic Updated Successfully');
        return redirect()->route('admin_parenting_topics_show', [$topic->id]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
