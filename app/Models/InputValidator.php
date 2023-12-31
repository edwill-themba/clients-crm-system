<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Date;
use DB;

class InputValidator extends Model
{
    use HasFactory;

    /**
     * checks if the user is legal to be a client
     * @param date_of_birth
     * @return integer
     */
    public function isUserLegal($date_of_birth)
    {
        $year = Date('Y');
        $year_of_birth = substr($date_of_birth, 0, 4);
        return $year - $year_of_birth;
    }

    /**
     * checks if id namber and date of birth correspond
     * @param date_of_birth
     * @param id_number
     */
    public function validDateOfBirth($date_of_birth, $id_number)
    {
        $isValid = false;
        // fields of the id 
        $year_id = substr($id_number, 0, 2);
        $month_id = substr($id_number, 2, 2);
        $day_id = substr($id_number, 4, 2);
        // fields of the date of birth  0000-00-00
        $year_birth = substr($date_of_birth, 2, 2);
        $months_birth = substr($date_of_birth, 5, 2);
        $day_birth = substr($date_of_birth, 8, 2);

        if ($year_id == $year_birth && $month_id == $months_birth && $day_id == $day_birth) {
            $isValid = true;
        } else {
            $isValid = false;
        }
        return $isValid;
    }

    /**
     * checks if the id belongs to client
     * @param id_number
     */
    public function checkID($id_number)
    {
        $id = DB::table('clients')
            ->select('id')
            ->where('id_number', '=', $id_number)
            ->get();

        if ($id == '[]') {
            return 0;
        } else {
            return $id[0]->id;
        }
    }

    /**
     * checks if the telephone belongs to client
     * @param id_number
     */
    public function checkPhone($telephone)
    {
        $id = DB::table('clients')
            ->select('id')
            ->where('telephone', '=', $telephone)
            ->get();

        if ($id == '[]') {
            return 0;
        } else {
            return $id[0]->id;
        }
    }
    /**
     * checks if the email belongs to client
     * @param id_number
     */
    public function checkEmail($email)
    {
        $id = DB::table('clients')
            ->select('id')
            ->where('email', '=', $email)
            ->get();

        if ($id == '[]') {
            return 0;
        } else {
            return $id[0]->id;
        }
    }


}
