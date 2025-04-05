<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\Admin\AdminController;
use App\Http\Controllers\Mobile\authController;
use App\Http\Controllers\User\UnauthenticateController;
use App\Models\Tournament;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::post('/add-account', [authController::class, 'register']);
Route::post('/login', [authController::class, 'user_login']);



Route::prefix('api')->middleware('isAdmin')->group(function () {
    Route::post('/user-list', [UserController::class, 'userList'])->name('user.list');
    Route::post('/user-data/{id}', [UserController::class, 'user_data']);
    Route::post('/update', [UserController::class, 'updateUser']);

    Route::post('/add-country', [UserController::class, 'addNewCountry']);
    Route::post('/get-country', [UserController::class, 'getCountryList']);
    Route::delete('/delete-country/{id}', [UserController::class, 'removeCountry']);
    Route::post('/add-match', [UserController::class, 'addMatch']);
    Route::get('/getteamlist', [UserController::class, 'getTemaList']);
    Route::get('/get-matchList', [UserController::class, 'matchList']);

    Route::post('/add-prize-banner', [AdminController::class, 'addPrizeBanner']);

    Route::post('/make-spin', [AdminController::class, 'newspin']);
    Route::post('/update-spin', [AdminController::class, 'updateSpin']);
    Route::post('/getspinList', [AdminController::class, 'SpinList']);
    Route::get('/get-spin/{id}', [AdminController::class, 'getspin']);

    Route::post('/new-message', [AdminController::class, 'newMessage']);
    Route::get('/notificaion-list', [AdminController::class, 'messageList']);
    Route::get('/message-details/{id}', [AdminController::class, 'messageDetails']);
    Route::post('/update-message', [AdminController::class, 'updateMessage']);

    Route::post('/add-slider', [AdminController::class, 'addSlider']);
    Route::get('/slider-list', [AdminController::class, 'sliderList']);
    Route::get('/delete-slider/{id}', [AdminController::class, 'deleteSlider']);
    Route::post('/update-match', [AdminController::class, 'update_match']);
    Route::post('/add-player', [AdminController::class, 'addPlayer']);
    Route::get('/player-details/{id}', [AdminController::class, 'player']);
    Route::post('/update-player', [AdminController::class, 'updateplayer']);

    Route::post('/make-tournament', [AdminController::class, 'saveTournament']);

    Route::get('/tournament-details/{id}', [AdminController::class, 'tournamentDetails']);
    Route::post('/add-tournament-teams', [AdminController::class, 'addTournamentTeam']);
    Route::post('/add-tournament-teams', [AdminController::class, 'addTournamentTeam']);

    Route::post('/add-team-player', [AdminController::class, 'addNewPlayer']);
    Route::get('/get-team-players', [AdminController::class, 'teamPlayers']);
    Route::get('/get-player-details/{id}', [AdminController::class, 'playerDetails']);
    Route::get('/update-player', [AdminController::class, 'updatePlayer']);

    // Max predict     
    Route::post('/add-max-predict', [AdminController::class, 'maxpredict']);
    Route::get('/get-maxpredictList', [AdminController::class, 'maxpredictList']);
    Route::get('/maxpredict-playerList', [AdminController::class, 'maxpredictPlayerList']);
    Route::get('/match-report-users', [AdminController::class, 'singleMatchpredictUsers']);



    Route::post('/predictions/semi-final', [AdminController::class, 'storeSemiFinal']);
    Route::post('/result/semi-final', [AdminController::class, 'storeSemiFinalResult']);
    Route::post('/predictions/final', [AdminController::class, 'storeFinal']);
    Route::post('/result/final', [AdminController::class, 'storeFinalresult']);
    Route::post('/predictions/champion', [AdminController::class, 'storeChampion']);
    Route::post('/result/champion', [AdminController::class, 'storeChampionresult']);

    Route::get('/predictions/semi-final/{user_id}', [AdminController::class, 'showSemiFinal']);
    Route::get('/predictions/final/{user_id}', [AdminController::class, 'showFinal']);
    Route::get('/predictions/champion/{user_id}', [AdminController::class, 'showChampion']);

    // New route to get users who have made predictions in all categories
    // Route::get('/predictions/users', [AdminController::class, 'getUsersWithPredictions']);
    Route::get('/users-with-predictions', [AdminController::class, 'getUsersWithPredictions']);
    Route::post('/add-single-match-result', [AdminController::class, 'SingleMatchResult']);
    Route::post('/add-batsman-result', [AdminController::class, 'BatsmanResult']);
    Route::post('/add-boller-result', [AdminController::class, 'BollerResult']);
});

Route::prefix('tournament')->middleware('isAdmin')->group(function () {
    Route::post('/update-tournament', [AdminController::class, 'UpdateTournament']);
});
Route::prefix('api')->group(function () {
    // ========== User list for select ==========
    Route::get('/user-data', [UnauthenticateController::class, 'user_list']);

    // ========== Team list By Match Id ==========
    Route::get('/team-data/{id}', [UnauthenticateController::class, 'teamList']);

    Route::post('/add-bastsman-predict', [UnauthenticateController::class, 'addBatsman']);
    Route::post('/add-bowler-predict', [UnauthenticateController::class, 'addBowler']);
    Route::get('/batsman/{id}', [UnauthenticateController::class, 'batsmanMatch']);
    Route::get('/baller/{id}', [UnauthenticateController::class, 'ballerMatch']);
    Route::get('/batsman-data', [UnauthenticateController::class, 'batsman']);
    Route::get('/bowlers-data', [UnauthenticateController::class, 'bowlers']);
    Route::get('/single-match/{id}', [UnauthenticateController::class, 'singleMatchData']);
    Route::get('/player-list/{id}', [UnauthenticateController::class, 'player_list']);
    // ========== Team list for select ==========
    Route::get('/team-list', [UnauthenticateController::class, 'countryList']);
    // ========== Tournament list for SHow with Pagination ==========
    Route::get('/get-tournamentList', [UnauthenticateController::class, 'tournamentList']);
    // Tournament team List 
    Route::get('/tournament-teams/{id}', [UnauthenticateController::class, 'tournamentTeamList']);
    Route::post('/remove-team', [UnauthenticateController::class, 'removeTeam']);
    // ========== Player list for select ==========
    Route::get('/player-list', [UnauthenticateController::class, 'playerlist']);
    Route::get('/tournament-playerList', [UnauthenticateController::class, 'tournamentPlayers']);
    // ---------------------- Single Match Predict ------------------
    Route::post('/add-singlematch-predict', [UnauthenticateController::class, 'makeSiglePredict']);
    Route::get('/max-match-players', [UnauthenticateController::class, 'maxPredictPlayers']);

    Route::get('/getUserPredictions/{userId}', [AdminController::class, 'getUserPredictions']);

    Route::get('/banner-sliders', [AdminController::class, 'sliderList']);
    Route::get('/singleMatch', [AdminController::class, 'singleMatch']);


    // ============================ Mobile API =====================
    // ---------------- Single match team predict ----------------
    Route::get('/matchs', [AdminController::class, 'matchs']);
    Route::get('/match-details/{id}', [AdminController::class, 'matchDetails']);
    Route::get('/check-match-prediction', [AdminController::class, 'CheckMatchPrediction']);

    // ---------------- Tournament predict ----------------
    Route::get('/get-last-tournament', [AdminController::class, 'lastTournament']);

    Route::get('/tournament-details/{id}', [AdminController::class, 'TournamentDetails']);
    Route::get('/tournamet/team-players', [AdminController::class, 'tournamentPlayers']);
    Route::post('/save-tournament', [AdminController::class, 'SaveTournamentReport']);
    
    Route::get('/predict-last-match', [AdminController::class, 'predictMatchget']);
    Route::get('/predict-match-players/{id}', [AdminController::class, 'predictMatchget']);
    Route::get('/prize-banner', [AdminController::class, 'PrizeBanner']);
    Route::get('/user-boller-report/{id}', [AdminController::class, 'userbollerReport']);
    Route::get('/user-predict-report', [AdminController::class, 'UserBollBat']);
    Route::get('/count-prediction', [AdminController::class, 'predictCount']);
    
    // view result 
    Route::get('/single-match-result/{id}', [AdminController::class, 'viewSingleMatchResult']);
    Route::get('/predict-match-result/{id}', [AdminController::class, 'viewPredictMatchResult']);


    // Winner 
    Route::get('/single-match-winner/{id}', [AdminController::class, 'singleWinner']);
    // spin list 
    
    // Route::post('/getspinList', [AdminController::class, 'SpinList']);
    Route::post('/spin-list', [AdminController::class, 'getSpinList']);




});
