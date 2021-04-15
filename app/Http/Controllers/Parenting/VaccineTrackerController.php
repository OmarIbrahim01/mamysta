<?php

namespace App\Http\Controllers\Parenting;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Vaccine;
use App\Models\VaccinePlace;
use App\Models\VaccinePlaceVaccine;
use App\Models\Region;
use App\Models\Gender;
use Auth;
use Carbon\Carbon;
use App\Models\ChildVaccine;

class VaccineTrackerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $user = Auth::user();
        $all_vaccines = Vaccine::all();
        $genders = Gender::all();

        return view('parenting.vaccine_tracker.index', [
            'user' => $user,
            'all_vaccines' => $all_vaccines,
            'genders' => $genders,
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
        $child_vaccine = new ChildVaccine;
        $child_vaccine->user_child_id = $child_id;
        $child_vaccine->vaccine_id = $request->vaccine;
        $child_vaccine->date = Carbon::createFromFormat('d/m/Y',$request->date);
        $child_vaccine->save();

        session()->flash('message', 'Vaccine record have been added Successfully');
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
