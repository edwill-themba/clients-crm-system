<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Auth;


class AuthController extends Controller
{
    /**
     * Logs the user in, if entered credentials are valid
     * If credentials are not valid an error message appears
     */
    public function login(Request $request)
    {
        // validate user input
        $this->validate($request, [
            'email' => 'required|email',
            'password' => 'required|min:3|max:78'
        ]);
        // checks if user is logged in with valid credentials
        if (Auth::attempt(['email' => $request->email, 'password' => $request->password])) {
            $user = User::where('email', $request->email)->first();
            $token = $user->createToken('login_token')->plainTextToken;
            return response()->json([['user' => $user], ['token' => $token]], 200);
        } else {
            return response()->json(['message' => 'unAhtorized'], 401);
        }
    }
    /**
     * Logs the user out
     */
    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();
        return response()->json(['message' => 'user successfully logged out'], 200);
    }
}
