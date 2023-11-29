<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Client;
use DB;
use Illuminate\Support\Str;

class ClientController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $clients = DB::table('clients')
            ->orderBy('created_at', 'desc')
            ->get();
        return response()->json(['clients' => $clients], 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'id_number' => 'required|numeric|unique:clients',
            'uuid' => 'unique:clients',
            'date_of_birth' => 'required|max:100',
            'first_name' => 'required|min:3|max:100|string',
            'last_name' => 'required|min:3|max:100|string',
            'email' => 'required|email|unique:clients|unique:users',
            'telephone' => 'required|numeric|unique:clients',
            'status' => 'required'
        ]);
        // gets values from user input
        $id_number = $request->input('id_number');
        $date_of_birth = $request->input('date_of_birth');
        $first_name = $request->input('first_name');
        $last_name = $request->input('last_name');
        $email = $request->input('email');
        $telephone = $request->input('telephone');
        $status = $request->input('status');
        // saves data to the database
        $client = DB::table('clients')->insert([
            'id_number' => $id_number,
            'uuid' => Str::orderedUuid(),
            'date_of_birth' => $date_of_birth,
            'first_name' => $first_name,
            'last_name' => $last_name,
            'email' => $email,
            'telephone' => $telephone,
            'status' => $status
        ]);

        return response()->json(['client' => $client], 201);
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
