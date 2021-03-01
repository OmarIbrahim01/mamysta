<?php

namespace App\Http\Controllers\Parenting;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Gender;
use App\Models\GrothCalculatorValue;
use Carbon\Carbon;

class GrothCalculatorController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $genders = Gender::all()->take(2);
        $groth_values = GrothCalculatorValue::all();

        return view('parenting.groth_calculator.index', [
                            'genders' => $genders,
                    ]);
    }


    public function result(Request $request)
    {

        $request->validate([
            'gender' => 'required|integer|between:1,2',
            'day' => 'required|integer|between:1,31',
            'month' => 'required|integer|between:1,12',
            'year' => 'required|integer|digits:4',
        ]);

        $genders = Gender::all()->take(2);
        $groth_values = GrothCalculatorValue::all();

        $gender = Gender::findOrFail($request->gender);
        $birthdate = Carbon::createFromFormat('d/m/Y', $request->day . '/' . $request->month . '/' . $request->year);
        $age_in_months = (int) round($birthdate->diffInDays(Carbon::now()) / 30);

        $groth_calculator_value = $groth_values->where('gender_id', $request->gender)->where('age', $age_in_months)->first();


        return view('parenting.groth_calculator.result', [
                            'genders' => $genders,
                            'groth_values' => $groth_values,
                            'birthdate' => $birthdate,
                            'gender' => $gender,
                            'age_in_months' => $age_in_months,
                            'groth_calculator_value' => $groth_calculator_value,
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
