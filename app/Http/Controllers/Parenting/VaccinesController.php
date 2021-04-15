<?php

namespace App\Http\Controllers\Parenting;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Vaccine;
use App\Models\VaccinePlace;
use App\Models\VaccinePlaceVaccine;
use App\Models\Region;
use Carbon\Carbon;


class VaccinesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $vaccines = Vaccine::all();

        return view('parenting.vaccines.index', [
                        'vaccines' => $vaccines,
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
    public function show(Request $request, $id)
    {
        $vaccine = Vaccine::findOrFail($id);
        $regions = Region::all();

        if(isset($request->region)){
            $region = Region::findOrFail($request->region);
            $my_region_vaccine_places = $region->vaccine_places->where('region_id', $region->id);
        }else{
            $my_region_vaccine_places = null;
        }

        return view('parenting.vaccines.show', [
                        'vaccine' => $vaccine,
                        'regions' => $regions,
                        'my_region_vaccine_places' => $my_region_vaccine_places,
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
