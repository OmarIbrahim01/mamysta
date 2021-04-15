<?php

namespace App\Http\Controllers\Parenting;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Vaccine;
use App\Models\VaccinePlace;
use App\Models\VaccinePlaceVaccine;
use App\Models\Region;

class VaccinePlacesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $vaccine_places = VaccinePlace::all();

        $regions = Region::all();

        if(isset($request->region)){
            $region = Region::findOrFail($request->region);
            $my_region_vaccine_places = $region->vaccine_places->where('region_id', $region->id);
        }else{
            $my_region_vaccine_places = null;
        }

        return view('parenting.vaccine_places.index', [
                        'vaccine_places' => $vaccine_places,
                        'regions' => $regions,
                        'my_region_vaccine_places' => $my_region_vaccine_places,
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
        $vaccine_place = VaccinePlace::findOrFail($id);

        return view('parenting.vaccine_places.show', [
                        'vaccine_place' => $vaccine_place,
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
