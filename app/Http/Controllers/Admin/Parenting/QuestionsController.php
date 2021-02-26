<?php

namespace App\Http\Controllers\Admin\Parenting;

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
        $statuses = ParentingQuestionStatus::all();
        $question_statuses = ParentingQuestionStatus::all()->skip(2)->take(2)->sortByDesc('id');
        $all_questions_count = ParentingQuestion::count();
        $questions = ParentingQuestion::all();

        if(isset($request->status)){
            $questions = $questions->where('parenting_questions_status_id', $request->status);
        }

        $questions = $questions->sortBy('id')->sortBy('parenting_questions_status_id');

        return view('admin.parenting.questions.index', [
                            'question_statuses' => $question_statuses,
                            'statuses' => $statuses,
                            'all_questions_count' => $all_questions_count,
                            'questions' => $questions
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
    public function submit_answer(Request $request, $question_id)
    {
        
        $answer = new ParentingAnswer;
        $answer->parenting_question_id = $question_id;
        $answer->user_id = Auth::id();
        $answer->answer = $request->answer;
        $answer->parenting_answer_status_id = 2;

        if($request->question_statuse == 1){
            $answer->parenting_answer_type_id = 3;
        }elseif($request->question_statuse == 2){
            $answer->parenting_answer_type_id = 3;
        }elseif($request->question_statuse == 3){
            $answer->parenting_answer_type_id = 1;
        }elseif($request->question_statuse == 4){
            $answer->parenting_answer_type_id = 3;
        }elseif($request->question_statuse == 5){
            $answer->parenting_answer_type_id = 3;
        }

        $answer->save();

        $question = ParentingQuestion::findOrFail($question_id);
        $question->parenting_questions_status_id = $request->question_statuse;
        $question->update();
        
        session()->flash('message', 'Question Have Been Answerd Successfully');
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
