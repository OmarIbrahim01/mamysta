<?php

namespace App\Http\Controllers\Parenting;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Auth;
use App\Models\Gender;
use App\Models\UserChild;
use App\Models\GrothTracker;
use App\Models\GrothCalculatorValue;
use Carbon\Carbon;


class GrothTrackerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $genders = Gender::all()->take(2);
        $children = Auth::user()->children;
        $groth_values = GrothCalculatorValue::all();

        return view('parenting.groth_tracker.index', [
                    'genders' => $genders,
                    'children' => $children,
                    'groth_values' => $groth_values,
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
    public function store(Request $request, $child_id)
    {
        // dd($request->all());

        $record = new GrothTracker;
        $record->user_child_id = $child_id;
        $record->date = Carbon::createFromFormat('d/m/Y',$request->date_of_measurement);
        $record->weight = $request->weight;
        $record->height = $request->height;
        $record->save();

        session()->flash('message', 'Record Have Been Added Successfully');
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
