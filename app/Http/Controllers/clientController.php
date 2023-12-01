<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Client;
use DB;
use Illuminate\Support\Str;
use App\Models\InputValidator;
use Illuminate\Support\Facades\Auth;
use function Egulias\EmailValidator\Result\isValid;

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
            'date_of_birth' => 'required|max:100|before:today',
            'first_name' => 'required|min:3|max:100|string',
            'last_name' => 'required|min:3|max:100|string',
            'email' => 'required|email|unique:clients|unique:users',
            'telephone' => 'required|numeric|unique:clients',
            'status' => 'required'
        ]);
        // check if user is logged in
        if (Auth::check()) {
        // gets values from user input
            $id_number = $request->input('id_number');
            $date_of_birth = $request->input('date_of_birth');
            $first_name = $request->input('first_name');
            $last_name = $request->input('last_name');
            $email = $request->input('email');
            $telephone = $request->input('telephone');
            $status = $request->input('status');

            $date_validate = (new InputValidator())->isUserLegal($date_of_birth);
            // checks if client is above 18 years
            if ($date_validate < 18 || $date_validate > 100) {
                return response()->json(['message' => 'a client must be 18 years old and above and less than 100 years old'], 422);
            }
            // checks the length of the id number
            if (strlen($id_number) !== 13) {
                return response()->json(['message' => 'the id number must be 13 numbers'], 422);
            }
            // checks the length of the phone number
            if (strlen($telephone) !== 10) {
                return response()->json(['message' => 'the telephone must be 10 numbers'], 422);
            }
            // checks if  date of birth correspond with year of id number
            $isValid = (new InputValidator())->validDateOfBirth($date_of_birth, $id_number);
            if (!$isValid) {
                return response()->json(['message' => 'the id number does not correspond with the date of birth'], 422);
            }
            // saves data to the database
            $client = DB::table('clients')->insert([
                'id_number' => $id_number,
                'uuid' => Str::orderedUuid(),
                'date_of_birth' => $date_of_birth,
                'first_name' => $first_name,
                'last_name' => $last_name,
                'email' => $email,
                'telephone' => $telephone,
                'status' => $status,
                'created_at' => now(),
                'updated_at' => now()
            ]);
        } else {
            return response()->json(['message' => 'you are unAuthorized to perform this action'], 401);
        }

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
        if (Auth::check()) {
            $client = Client::find($id);
        } else {
            return response()->json(['message' => 'you are unAthorized to perform this operation'], 401);
        }
        return response()->json(['client' => $client], 200);
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
        $this->validate($request, [
            'id_number' => 'required|numeric|unique:clients',
            'uuid' => 'unique:clients',
            'date_of_birth' => 'required|max:100|before:today',
            'first_name' => 'required|min:3|max:100|string',
            'last_name' => 'required|min:3|max:100|string',
            'email' => 'required|email|unique:clients|unique:users',
            'telephone' => 'required|numeric|unique:clients',
            'status' => 'required'
        ]);
        // check if user is logged in
        if (Auth::check()) {
        // gets values from user input
            $client = Client::find($id);
            $client->id_number = $request->input('id_number');
            $client->date_of_birth = $request->input('date_of_birth');
            $client->first_name = $request->input('first_name');
            $client->last_name = $request->input('last_name');
            $client->email = $request->input('email');
            $client->telephone = $request->input('telephone');
            $client->status = $request->input('status');

            $date_validate = (new InputValidator())->isUserLegal($client->date_of_birth);
            // checks if client is above 18 years
            if ($date_validate < 18 || $date_validate > 100) {
                return response()->json(['message' => 'a client must be 18 years old and above and less than 100 years old'], 422);
            }
            // checks the length of the id number
            if (strlen($client->id_number) !== 13) {
                return response()->json(['message' => 'the id number must be 13 numbers'], 422);
            }
            // checks the length of the phone number
            if (strlen($client->telephone) !== 10) {
                return response()->json(['message' => 'the telephone must be 10 numbers'], 422);
            }
            // checks if  date of birth correspond with year of id number
            $isValid = (new InputValidator())->validDateOfBirth($client->date_of_birth, $client->id_number);
            if (!$isValid) {
                return response()->json(['message' => 'the id number does not correspond with the date of birth'], 422);
            }
            // saves data to the database
            $client->save();
        } else {
            return response()->json(['message' => 'you are unAuthorized to perform this action'], 401);
        }

        return response()->json(['client' => $client], 201);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //check if user is authorized
        if (Auth::check()) {
            \DB::table('clients')->where('id', '=', $id)->delete();
        } else {
            return response()->json(['message' => 'you are unAthorized to perform this operation'], 401);
        }
        return response()->json(['message' => 'cliet successfully deleted'], 200);
    }

    /**
     * Filter the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function filter(Request $request)
    {
        if (Auth::check()) {
            $filter = $request->input('filter');
            $results = DB::table('clients')
                ->where('first_name', 'like', '%' . $filter . '%')
                ->orWhere('last_name', 'like', '%' . $filter . '%')
                ->orWhere('email', '=', $filter)
                ->orWhere('telephone', 'like', '%' . $filter . '%')
                ->first();
        } else {
            return response()->json(['message' => 'you are unAthorized to perform this operation'], 401);
        }
        if (empty($results)) {
            return response()->json(['message' => 'Not Found'], 404);
        }
        return response()->json(['results' => $results], 200);
    }
}
