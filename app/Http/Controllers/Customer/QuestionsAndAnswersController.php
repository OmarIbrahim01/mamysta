<?php

namespace App\Http\Controllers\Customer;

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

class QuestionsAndAnswersController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $genders = Gender::all()->take(3);
        $categories = ParentingQuestionCategory::all();
        $user = Auth::user();
        $questions = $user->questions->sortByDesc('parenting_questions_status_id');
        return view('customer.questions_and_answers.index', [
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
        //
    }

    public function answer_store(Request $request, $question_id)
    {

        $answer = new ParentingAnswer;
        $answer->parenting_question_id = $question_id;
        $answer->user_id = Auth::id();
        $answer->parenting_answer_type_id = 2;
        $answer->parenting_answer_status_id = 2;
        $answer->answer = $request->user_answer;
        $answer->save();

        $question = ParentingQuestion::findOrFail($question_id);
        $question->parenting_questions_status_id = 1;
        $question->save();

        session()->flash('message', 'New Answer Have been Submited Successfully');
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
