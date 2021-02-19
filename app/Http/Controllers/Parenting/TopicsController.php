<?php

namespace App\Http\Controllers\Parenting;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\ParentingTopic;
use App\Models\ParentingTopicCategory;

class TopicsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $categories = ParentingTopicCategory::all();
        $topics = ParentingTopic::all()->sortByDesc('id');

        if(isset($request->category)){
            $topics = $topics->where('parenting_topic_category_id', $request->category);
        }

        return view('parenting.topics.index', [
                                'topics' => $topics,
                                'categories' => $categories
                    ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $categories = ParentingTopicCategory::all();
        $topic = ParentingTopic::findOrFail($id);

        return view('parenting.topics.show', [ 
                                'topic' => $topic,
                                'categories' => $categories
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
        //
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
        //
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
