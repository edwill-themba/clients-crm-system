<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Themba Client CRM System</title>
        <!-- app style sheet -->
        <link rel="stylesheet" href="{{'css/app.css'}}">
    </head>
    <body>
      <div id="app">
         <div class="page">
           <navbar />
         </div>
      </div>
      <!-- load application js script -->
      <script src="{{ asset('js/app.js') }}"></script>
    </body>
</html>
