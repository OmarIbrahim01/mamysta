<?php

namespace App\Http\Controllers\Customer;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Auth;
use App\Models\Gender;
use App\Models\UserChild;

class ChildrenController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $genders = Gender::all()->take(2);
        $children = Auth::user()->children->all();

        return view('customer.children.index', [
                        'genders' => $genders,
                        'children' => $children,
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

        $child = new UserChild;
        $child->user_id = Auth::id();
        $child->gender_id = $request->gender;
        $child->name = $request->name;
        $child->birthday = $request->year.'-'.$request->month.'-'.$request->day;
        $child->save();

        session()->flash('message', 'Child Have Been Added Successfully');
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
        $genders = Gender::all()->take(2);
        $child = UserChild::findOrFail($id);

        return view('customer.children.edit', [
                        'genders' => $genders,
                        'child' => $child,
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
        
        $child = UserChild::findOrFail($id);
        $child->user_id = Auth::id();
        $child->gender_id = $request->gender;
        $child->name = $request->name;
        $child->birthday = $request->year.'-'.$request->month.'-'.$request->day;
        $child->save();

        session()->flash('message', 'Child Have Been Update Successfully');
        return redirect()->route('user_children_index');
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
