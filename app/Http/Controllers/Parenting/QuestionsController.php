<?php

namespace App\Http\Controllers\Parenting;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Auth;
use App\Models\ParentingQuestion;
use App\Models\ParentingAnswer;
use App\Models\ParentingAnswerType;
use App\Models\ParentingQuestionCategory;
use App\Models\ParentingQuestionStatus;
use App\Models\ParentingQuestionSubcategory;
use App\Models\Gender;


class QuestionsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $categories = ParentingQuestionCategory::all();
        $questions = ParentingQuestion::all()->where('parenting_questions_status_id', 4)->sortByDesc('id');
        $genders = Gender::all()->take(3);

        if(isset($request->category)){
            $questions = $questions->where('parenting_questions_category_id', $request->category);
        }

        if(isset($request->subcategory)){
            $questions = $questions->where('parenting_questions_subcategory_id', $request->subcategory);
        }


        return view('parenting.questions_and_answers.index', [
                            'questions' => $questions,
                            'categories' => $categories,
                            'genders' => $genders
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

        $question = new ParentingQuestion;
        $question->user_id = Auth::id();
        $question->parenting_questions_category_id = $request->category;
        $question->parenting_questions_subcategory_id = 1;
        $question->parenting_questions_status_id = 1;
        $question->user_child_id = null;
        $question->age = $request->age;
        $question->gender = $request->gender;
        $question->question = $request->question;

        if(isset($request->privet)){
            $question->privet = 1;
        }else{
            $question->privet = 0;
        }

        $question->save();

        session()->flash('message', 'New Question Have been Submited Successfully');
        return redirect()->back();
        
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
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
