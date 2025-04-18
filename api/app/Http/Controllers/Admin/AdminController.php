<?php

namespace App\Http\Controllers\Admin;

use Carbon\Carbon;
use App\Models\User;
use App\Models\Slider;
use App\Models\Players;
use App\Models\SpinList;
use App\Models\MatchList;
use App\Models\Tournament;
use App\Models\PredictTeam;
use App\Models\PrizeBanner;
use App\Models\TeamPlayers;
use App\Models\Notification;
use App\Models\NotificationUser;
use App\Models\PredictMatch;
use Illuminate\Http\Request;
use App\Models\PredictPlayer;
use App\Models\MatchRun;
use App\Models\TournamentTeam;
use App\Models\singleMatchReport;
use App\Http\Controllers\Controller;
use App\Models\BallerResult;
use App\Models\Batsman;
use App\Models\Credit;
use App\Models\BatsmanResult;
use App\Models\Boller;
use App\Models\Champion;
use App\Models\ChampionResult;
use App\Models\Finalist;
use App\Models\FinalistResult;
use App\Models\SemiFinal;
use App\Models\SemiFinalResult;
use App\Models\SingleMatchResult;
use App\Models\SiteSetting;
use App\Models\TournamentTeamsPlayers;
use Illuminate\Auth\Events\Validated;
use Illuminate\Support\Facades\Validator;

class AdminController extends Controller
{
    // ðŸ”¹ **Generate Pagination Links with Ellipsis**
    private function generatePaginationLinks($data)
    {
        $links = [];
        $currentPage = $data->currentPage();
        $lastPage = $data->lastPage();

        if ($currentPage > 1) {
            $links[] = ['label' => 'Prev', 'url' => $data->url($currentPage - 1)];
        }

        $links[] = ['label' => 1, 'url' => $data->url(1), 'active' => $currentPage == 1];

        if ($currentPage > 3) {
            $links[] = ['label' => '...', 'url' => null];
        }

        for ($i = max(2, $currentPage - 1); $i <= min($lastPage - 1, $currentPage + 1); $i++) {
            $links[] = ['label' => $i, 'url' => $data->url($i), 'active' => $i == $currentPage];
        }

        if ($currentPage < $lastPage - 2) {
            $links[] = ['label' => '...', 'url' => null];
        }

        if ($lastPage > 1) {
            $links[] = ['label' => $lastPage, 'url' => $data->url($lastPage), 'active' => $currentPage == $lastPage];
        }

        if ($currentPage < $lastPage) {
            $links[] = ['label' => 'Next', 'url' => $data->url($currentPage + 1)];
        }

        return $links;
    }

    public function addPrizeBanner(Request $request)
    {
        // dd($request->all());
        $validate = Validator::make($request->all(), [
            'name' => 'required||string',
            'image' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
            'type' => 'integer||required',
        ]);
        if ($validate->fails()) {
            return response()->json($validate->errors());
        }

        if ($request->hasFile('image')) {

            $image = $request->image;
            $imageName = time() . "." . $image->getClientOriginalExtension();
            $image->move(public_path('uploads'), $imageName);

            $query = PrizeBanner::create([
                'name' => $request->name,
                'type' => $request->type,
                'banner' => $imageName,
                'status' => '1',
            ]);

            return response()->json([
                'message' => "Success",
                'data' => $query,
            ]);
        }
    }
    public function PrizeBanner()
    {
        $BattingprizeBanner = PrizeBanner::where('type', '1')->orderby('id', "desc")->first();
        $BowlingprizeBanner = PrizeBanner::where('type', '2')->orderby('id', "desc")->first();
        $TournamentprizeBanner = PrizeBanner::where('type', '3')->orderby('id', "desc")->first();

        return response()->json([
            'batting' => $BattingprizeBanner ? array_merge($BattingprizeBanner->toArray(), [
                'image' => url('uploads/' . $BattingprizeBanner->banner)
            ]) : null,

            'bowling' => $BowlingprizeBanner ? array_merge($BowlingprizeBanner->toArray(), [
                'image' => url('uploads/' . $BowlingprizeBanner->banner)
            ]) : null,

            'tournament' => $TournamentprizeBanner ? array_merge($TournamentprizeBanner->toArray(), [
                'image' => url('uploads/' . $TournamentprizeBanner->banner)
            ]) : null,
        ]);
    }
    public function newspin(request $request)
    {

        $validated = Validator::make($request->all(), [
            'name' => 'required|string',
            'prize' => 'required|string',
        ]);
        if ($validated->fails()) {
            return response()->json([
                'errors' => $validated->errors(),
            ], 401);
        }

        $save = SpinList::create([
            'name' => $request->name,
            'prize' => $request->prize,
            'status' => '1',
        ]);

        if ($save) {

            return response()->json([
                'message' => "successfully Create a new spin",
                'data' => $save,
            ]);
        }
    }
    public function SpinList(Request $request)
    {
        $query = SpinList::query();

        // Apply search filter
        if ($request->has('searchInput') && !empty($request->searchInput)) {
            $query->where('name', 'like', '%' . $request->searchInput . '%');
        }

        // Apply status filter
        if ($request->has('status') && $request->status !== null) {
            $query->where('status', $request->status);
        }

        // Apply pagination (default 10 items per page)
        $data = $query->orderBy('id', 'desc')->paginate($request->items ?? 10);

        $count = SpinList::count();

        return response()->json([
            'data' => $data->items(),
            'count' => $count,
            'pagination' => [
                'current_page' => $data->currentPage(),
                'last_page' => $data->lastPage(),
                'per_page' => $data->perPage(),
                'total' => $data->total(),
                'next_page_url' => $data->nextPageUrl(),
                'prev_page_url' => $data->previousPageUrl(),
                'links' => $this->generatePaginationLinks($data),
            ]
        ]);
    }
    public function getSpinList(Request $request)
    {
        $data = SpinList::get();

        return response()->json($data);
    }




    public function getspin($id)
    {
        $data = SpinList::where('id', $id)->first();
        return response()->json($data);
    }

    public function updateSpin(request $request)
    {

        $validated = Validator::make($request->all(), [
            'id' => 'required',
            'name' => 'required|string',
            'prize' => 'required|string',
            'status' => 'required',
        ]);
        if ($validated->fails()) {
            return response()->json([
                'errors' => $validated->errors(),
            ], 401);
        }

        $data = SpinList::where('id', $request->id)->first();

        $save = $data->update([
            'name' => $request->name,
            'prize' => $request->prize,
            'status' => $request->status,
        ]);

        if ($save) {

            return response()->json([
                'message' => "Update success",
                'data' => $save,
            ]);
        }
    }


    public function newMessage(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'message' => 'required|string|min:5',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        // Create the notification
        $notification = Notification::create([
            'message' => $request->message,
            'status' => "1",
        ]);

        // Attach notification to all users
        $userIds = User::pluck('id')->toArray(); // cleaner than get()

        $notificationData = [];
        foreach ($userIds as $userId) {
            $notificationData[] = [
                'notification_id' => $notification->id,
                'user_id' => $userId,
                'status' => 'unread',
                'created_at' => now(),
                'updated_at' => now(),
            ];
        }

        NotificationUser::insert($notificationData); // bulk insert is faster

        return response()->json(['message' => 'Notification sent successfully.']);
    }



    public function messageList(Request $request)
    {
        $query = Notification::query();


        if ($request->filled('user_id')) {

            $messageList = NotificationUser::where("user_id", $request->user_id)->with('message')->orderBy('created_at', 'desc')->paginate($request->items);

            if ($messageList) {
                $data = NotificationUser::where("user_id", $request->user_id)->with('message')->get();
                foreach ($data as $item) {
                    $item->update([
                        'status' => 'read',
                    ]);
                }
            }

            $messageList->getCollection()->transform(function ($item) {
                $item->created = $item->created_at->format('d M Y h:i A');
                return $item;
            });

            return response()->json([
                'data' => $messageList->items(),
                'pagination' => [
                    'current_page' => $messageList->currentPage(),
                    'last_page' => $messageList->lastPage(),
                    'per_page' => $messageList->perPage(),
                    'total' => $messageList->total(),
                    'next_page_url' => $messageList->nextPageUrl(),
                    'prev_page_url' => $messageList->previousPageUrl(),
                    'links' => $this->generatePaginationLinks($messageList),
                ]
            ]);
        } else {
            if ($request->has('searchInput')) {
                $query->where('message', 'like', '%' . $request->searchInput . '%');
            }

            $data = $query->orderBy('id', 'desc')->paginate($request->items);

            $data->getCollection()->transform(function ($item) {
                $item->created = $item->created_at->format('d M Y h:i A');
                return $item;
            });
            // dd($data);

            return response()->json([
                'data' => $data->items(),
                'pagination' => [
                    'current_page' => $data->currentPage(),
                    'last_page' => $data->lastPage(),
                    'per_page' => $data->perPage(),
                    'total' => $data->total(),
                    'next_page_url' => $data->nextPageUrl(),
                    'prev_page_url' => $data->previousPageUrl(),
                    'links' => $this->generatePaginationLinks($data),
                ]
            ]);
        }
    }



    public function messageDetails($id)
    {
        $data = Notification::where('id', $id)->first();
        return response()->json($data);
    }
    public function updateMessage(request $request)
    {

        $data = Notification::where('id', $request->id)->first();
        $data->update([
            'message' => $request->message,
        ]);

        return response()->json([
            'message' => "success",
        ]);
    }

    public function addSlider(request $request)
    {

        $validate = Validator::make($request->all(), [
            'image' => 'required|mimes:jpg,png,jpeg,webp',
        ]);
        if ($validate->fails()) {
            return response()->json([
                'error' => $validate->errors(),
            ], 401);
        }

        if ($request->hasFile('image')) {

            $image = $request->file('image');
            $fileName = rand() . "." . $image->getClientOriginalExtension();
            $image->move(public_path('uploads'), $fileName);

            $data = Slider::create([
                'image' => $fileName,
            ]);

            return response()->json([
                'message' => "success"
            ]);
        } else {
            return response()->json([
                'message' => "Image Not Found"
            ]);
        }
    }

    public function sliderList()
    {
        $data = Slider::orderby('id', 'desc')->get();

        $data->transform(function ($item) {
            $item->banner = url('uploads/' . $item->image);
            return $item;
        });

        return response()->json($data);
    }
    public function deleteSlider($id)
    {
        $data = Slider::find($id);

        if (!$data) {
            return response()->json(['message' => "Slider not found."], 404);
        }

        $data->delete();

        return response()->json(['message' => "Successfully deleted."], 200);
    }
    public function matchDetails($id)
    {

        $data = MatchList::where('id', $id)
            ->with(["teamA", "teamB"])
            ->first();

        if ($data) {
            $baseUrl = url('uploads/');
            $data->image = url($data->image);

            $data->teamA->image = $baseUrl . '/' . $data->teamA->image;
            $data->teamB->image = $baseUrl . '/' . $data->teamB->image;


            // $data->time = \Carbon\Carbon::parse($data->time)->format('d M Y h:i A');
            // $data->end_date = \Carbon\Carbon::parse($data->end_date)->format('d M Y h:i A');
        }


        return response()->json($data);
    }
    public function update_match(request $request)
    {
        $validate = Validator::make($request->all(), [
            "id" => "required",
            "teamA" => "required|integer",
            "teamB" => "required|integer",
            // "dateTime" => "required",
            // "enddateTime" => "required",
            "image" => "image|mimes:png,webp|dimensions:height=350,width=700",
        ]);

        if ($validate->fails()) {
            return response()->json(["errors" => $validate->errors()], 422);
        }

        $data = MatchList::where('id', $request->id)->first();

        if ($request->hasFile('image')) {

            $image = $request->image;
            $imageName = time() . "." . $image->getClientOriginalExtension();
            $image->move(public_path('uploads'), $imageName);

            // Set the image path to save in the database
            $imagePath = 'uploads/' . $imageName;


            if ($request->startDate && $request->endDate) {
                $data->update([
                    'team_a' => $request->teamA,
                    'team_b' => $request->teamB,
                    'time' => $request->startDate,
                    'end_date' => $request->endDate,
                    'status' => $request->status,
                    'image' => $imagePath,
                ]);

                return response()->json(['message' => "successfully Update"]);
            } else {
                $data->update([
                    'team_a' => $request->teamA,
                    'team_b' => $request->teamB,
                    'status' => $request->status,
                    'image' => $imagePath,
                ]);

                return response()->json(['message' => "successfully Update"]);
            }
        } else {

            if ($request->startDate && $request->endDate) {
                $data->update([
                    'team_a' => $request->teamA,
                    'team_b' => $request->teamB,
                    'time' => $request->startDate,
                    'end_date' => $request->endDate,
                    'status' => $request->status,
                ]);

                return response()->json(['message' => "successfully Update"]);
            } else {
                $data->update([
                    'team_a' => $request->teamA,
                    'team_b' => $request->teamB,
                    'status' => $request->status,
                ]);

                return response()->json(['message' => "successfully Update"]);
            }
        }
    }


    public function saveTournament(Request $request)
    {

        $teams = collect($request->teams)->map(function ($team) {
            return json_decode($team, true);
        })->toArray();

        // Replace the request input with properly formatted teams
        $request->merge(['teams' => $teams]);

        $messages = [
            'tname.required' => 'Tournament name is required.',
            'tdate.required' => 'Tournament Start date is required.',
            'tenddate.required' => 'Tournament End date is required.',
            'teams.required' => 'At least one team is required.',
            'teams.array' => 'Teams should be an array.',
            'teams.*.team_id.required' => 'Each team must have a valid ID.',
            'teams.*.team_id.exists' => 'The selected team is invalid.',
            'teams.*.players.required' => 'Each team must have at least one player.',
            'teams.*.players.*.required' => 'Each player in the team is required.',
            'teams.*.players.*.exists' => 'The selected player is invalid.',
        ];
        // Validate the request
        $Validate = $request->validate([
            'tname' => 'required|string',
            'tdate' => 'required|date',
            'tenddate' => 'required|date',
            'teams' => 'required|array|min:1',
            'teams.*.team_id' => 'required|integer|exists:countries,id', // Ensure team exists
            'teams.*.players' => 'required|array|min:1',
            'teams.*.players.*' => 'required|integer|exists:team_players,id', // Ensure players exist
        ], $messages);


        // Create the tournament
        $tournament = Tournament::create([
            'name' => $request->tname,
            'start_date' => $request->tdate,
            'end_date' => $request->tenddate,
            'status' => '1',
        ]);

        // Save teams and players
        foreach ($request->teams as $teamData) {
            $tournamentTeam = TournamentTeam::create([
                'tournament_id' => $tournament->id,
                'team_id' => $teamData['team_id'],
                'status' => '1',
            ]);

            // Save players in TournamentTeamsPlayers
            foreach ($teamData['players'] as $playerId) {
                TournamentTeamsPlayers::create([
                    'tournament_id' => $tournament->id,
                    'tournament_team_id' => $tournamentTeam->id,
                    'player_id' => $playerId,
                ]);
            }
        }

        return response()->json([
            'message' => 'Tournament, teams, and players created successfully',
            'tournament' => $tournament,
        ]);
    }

    public function tournamentDetails($id)
    {
        $data = Tournament::where('id', $id)
            ->with(['teams', 'teams.team', 'players', 'players.player'])
            ->first();
        return response()->json($data);
    }
    public function UpdateTournament(Request $request)
    {
        // Validate the request
        $request->validate([
            'name' => 'required|string|max:255',
            'start_date' => 'required|date',
            'end_date' => 'required|date|after_or_equal:start_date',
            'status' => 'required|in:0,1,2',
        ]);

        $tournament = Tournament::where("id", $request->id)->first();

        // dd($tournament);

        $tournament->update([
            "name" => $request->name,
            "start_date" => $request->start_date,
            "end_date" => $request->end_date,
            "status" => $request->status,
        ]);

        return response()->json([
            'message' => 'Tournament updated successfully!',
            'tournament' => $tournament,
        ]);
    }
    public function addTournamentTeam(Request $request)
    {
        // Validate request data
        $validate = Validator::make($request->all(), [
            'tournament_id' => 'required|integer|exists:tournaments,id',
            'teams' => 'required|array',
            'teams.*' => 'integer|exists:countries,id', // Validate that each team ID exists in the teams table
        ]);
        if ($validate->fails()) {
            return response()->json(['error' => $validate->errors()], 422);
        }

        $tournamentId = $request->tournament_id;
        $addedTeams = [];
        foreach ($request->teams as $teamId) {
            $teamId = (int) $teamId;
            $exists = TournamentTeam::where('tournament_id', $tournamentId)
                ->where('team_id', $teamId)
                ->exists();

            if (!$exists) {
                TournamentTeam::create([
                    'tournament_id' => $tournamentId,
                    'team_id' => $teamId,
                    'status' => 1, // Assuming "1" is an active status
                ]);
                $addedTeams[] = $teamId; // Add the team to the added list
            }
        }

        // If no teams were added, return a message indicating that
        if (empty($addedTeams)) {
            return response()->json(['message' => "No new teams added. All teams were already registered."], 200);
        }

        // Return success message and list of added teams
        return response()->json(['message' => "Teams added successfully!", 'added_teams' => $addedTeams]);
    }
    public function addNewPlayer(Request $request)
    {
        // Remove the dd() line
        // dd($request->all());

        $validate = Validator::make($request->all(), [
            // "team_id"       => "integer|required",
            "player_name" => "string|required",
        ]);

        if ($validate->fails()) {
            return response()->json(['error' => $validate->errors()], 422);
        }

        $data = TeamPlayers::create([
            'player_name' => $request->player_name,
            'status' => "1",
        ]);

        return response()->json(['message' => "Player successfully added", 'data' => $data], 201);
    }
    public function teamPlayers(request $request)
    {

        $query = teamPlayers::query();
        // $data = teamPlayers::orderBy('id', 'desc')->query();  

        if ($request->filled('searchInput')) {
            $query->where('player_name', 'like', '%' . $request->searchInput . '%');
        }
        if ($request->filled('status')) {
            $query->where('status', $request->status);
        }
        $data = $query->orderby('player_name', 'asc')->paginate($request->items);
        return response()->json([
            'data' => $data->items(),
            'pagination' => [
                'current_page' => $data->currentPage(),
                'last_page' => $data->lastPage(),
                'per_page' => $data->perPage(),
                'total' => $data->total(),
                'next_page_url' => $data->nextPageUrl(),
                'prev_page_url' => $data->previousPageUrl(),
                'links' => $this->generatePaginationLinks($data),
            ]
        ]);
    }
    public function playerDetails($id)
    {
        $data = teamPlayers::where('id', $id)->first();
        return response()->json($data);
    }
    public function updatePlayer(request $request)
    {
        // dd($request->all());
        $player = teamPlayers::where('id', $request->player_id)->first();

        $player->update([
            "player_name" => $request->player_name,
            "status" => $request->status,
        ]);

        return response()->json(['message' => "Player successfully Update"], 201);
    }

    public function maxpredict(Request $request)
    {
        // Log the incoming request data for debugging purposes

        // Validate the request
        $request->validate([
            'start_date' => 'required',
            'end_date' => 'required',
            'teams' => 'required|array',
            'teams.*.team_id' => 'required', // Ensure team exists
            'teams.*.players' => 'required|array|min:15',
            // 'teams.*.players.*' => 'exists,id'
        ]);

        // Create Match
        $match = PredictMatch::create([
            'start_date' => $request->start_date,
            'end_date' => $request->end_date,
        ]);
        // dd($request->teams);

        // Attach Teams and Players
        foreach ($request->teams as $teamData) {

            // dd($teamData);

            $team = PredictTeam::create([
                'predict_match_id' => $match->id,
                'country_id' => $teamData['team_id'],
            ]);


            foreach ($teamData['players'] as $playerId) {
                PredictPlayer::create([
                    'predict_match_id' => $match->id,
                    'predict_team_id' => $team->id,
                    'player_id' => $playerId,
                ]);
            }
        }

        return response()->json(['message' => 'Predict Match created successfully!'], 201);
    }

    public function maxpredictList(request $request)
    {
        // $data = PredictMatch::with(['teams', 'teams.country'])
        //     ->orderBy('id', 'desc')
        //     ->get();

        $query = PredictMatch::with(['teams', 'teams.country']); // No need for ->query()

        if ($request->filled('searchInput')) {
            $query->whereHas('teams.country', function ($q) use ($request) {
                $q->where('name', 'like', '%' . $request->searchInput . '%');
            });
        }

        if ($request->filled('status')) {
            $query->where('status', $request->status);
        }

        $data = $query->orderBy('id', 'desc')->paginate($request->items);

        $data->getCollection()->transform(function ($match) {
            $match->start_date = Carbon::parse($match->start_date)->format('d M Y, h:i A');
            $match->end_date = Carbon::parse($match->end_date)->format('d M Y, h:i A');
            return $match;
        });

        return response()->json([
            'data' => $data->items(),
            'pagination' => [
                'current_page' => $data->currentPage(),
                'last_page' => $data->lastPage(),
                'per_page' => $data->perPage(),
                'total' => $data->total(),
                'next_page_url' => $data->nextPageUrl(),
                'prev_page_url' => $data->previousPageUrl(),
                'links' => $this->generatePaginationLinks($data),
            ]
        ]);
    }

    public function maxpredictPlayerList(request $request)
    {
        $query = PredictPlayer::where('predict_match_id', $request->id)->with(['player', 'team', 'team.country', 'match', 'bollResult', 'batResult']);


        if ($request->filled('searchInput')) {
            $query->whereHas('player', function ($q) use ($request) {
                $q->where('player_name', 'like', '%' . $request->searchInput . '%');
            });
        }

        if ($request->filled('status')) {
            $query->where('status', $request->status);
        }

        $data = $query->orderBy('id', 'desc')->paginate($request->items);


        return response()->json([
            'data' => $data->items(),
            'pagination' => [
                'current_page' => $data->currentPage(),
                'last_page' => $data->lastPage(),
                'per_page' => $data->perPage(),
                'total' => $data->total(),
                'next_page_url' => $data->nextPageUrl(),
                'prev_page_url' => $data->previousPageUrl(),
                'links' => $this->generatePaginationLinks($data),
            ]
        ]);
    }
    public function singleMatchpredictUsers(request $request)
    {
        if ($request->filled('status')) {

            // dd($request->status);
            if ($request->status == 'win') {

                $winner = SingleMatchResult::where('match_id', $request->match_id)->first();

                $winner_team_id = $winner->team_id;

                $query = singleMatchReport::where('match_report.match_id', $request->match_id)
                    ->where('match_report.predict_team_id', $winner_team_id)
                    ->join('match_run', function ($join) {
                        $join->on('match_report.match_id', '=', 'match_run.match_id')
                            ->on('match_report.user_id', '=', 'match_run.user_id');
                    })
                    ->with([
                        'user',
                        'result.team',
                        'team',
                        'match',
                        'match.teamA',
                        'match.teamB'
                    ])
                    ->select([
                        'match_report.*',
                        'match_run.run as run',
                    ]);



                $data = $query->orderBy('id', 'asc')->paginate($request->items ?? 10);

                // dd($data);

                return response()->json([
                    'data' => $data->items(),
                    'pagination' => [
                        'current_page' => $data->currentPage(),
                        'last_page' => $data->lastPage(),
                        'per_page' => $data->perPage(),
                        'total' => $data->total(),
                        'next_page_url' => $data->nextPageUrl(),
                        'prev_page_url' => $data->previousPageUrl(),
                        'links' => $this->generatePaginationLinks($data),
                    ]
                ]);
            } elseif ($request->status == 'lose') {
                $winner = SingleMatchResult::where('match_id', $request->match_id)->first();

                $winner_team_id = $winner->team_id;

                // $query = singleMatchReport::where('match_id', $request->match_id)->whereNot('predict_team_id', $winner_team_id)->with(['run', 'user', 'result.team', 'team', 'match', 'match.teamA', 'match.teamB']);
                $query = singleMatchReport::where('match_report.match_id', $request->match_id)
                    ->whereNot('predict_team_id', $winner_team_id)
                    ->join('match_run', function ($join) {
                        $join->on('match_report.match_id', '=', 'match_run.match_id')
                            ->on('match_report.user_id', '=', 'match_run.user_id');
                    })
                    ->with([
                        'user',
                        'result.team',
                        'team',
                        'match',
                        'match.teamA',
                        'match.teamB'
                    ])
                    ->select([
                        'match_report.*',
                        'match_run.run as run',
                    ]);


                $data = $query->orderBy('id', 'asc')->paginate($request->items ?? 10);

                return response()->json([
                    'data' => $data->items(),
                    'pagination' => [
                        'current_page' => $data->currentPage(),
                        'last_page' => $data->lastPage(),
                        'per_page' => $data->perPage(),
                        'total' => $data->total(),
                        'next_page_url' => $data->nextPageUrl(),
                        'prev_page_url' => $data->previousPageUrl(),
                        'links' => $this->generatePaginationLinks($data),
                    ]
                ]);
            }
        } else {
            // dd($request->all());
            $query = singleMatchReport::query()
                ->where('match_report.match_id', $request->match_id)
                ->join('match_run', function ($join) {
                    $join->on('match_report.match_id', '=', 'match_run.match_id')
                        ->on('match_report.user_id', '=', 'match_run.user_id');
                })
                ->with([
                    'user',
                    'result.team',
                    'team',
                    'match',
                    'match.teamA',
                    'match.teamB'
                ])
                ->select([
                    'match_report.*',
                    'match_run.run as run',
                ]);



            // Filter by team name if search input is provided
            if ($request->has('searchInput')) {
                $searchInput = $request->searchInput;

                $query->where(function ($q) use ($searchInput) {
                    // Search within teams
                    $q->whereHas('user', function ($teamQuery) use ($searchInput) {
                        $teamQuery->where('username', 'like', "%{$searchInput}%");
                    });
                });
            }

            $data = $query->orderBy('id', 'asc')->paginate($request->items ?? 10);

            // Format created_at before returning
            $formattedData = $data->map(function ($item) {
                $item->create_time = Carbon::parse($item->created_at)->format('d M Y, h:i A');
                return $item;
            });
            // dd($formattedData);
            return response()->json([
                'data' => $formattedData,
                'pagination' => [
                    'current_page' => $data->currentPage(),
                    'last_page' => $data->lastPage(),
                    'per_page' => $data->perPage(),
                    'total' => $data->total(),
                    'next_page_url' => $data->nextPageUrl(),
                    'prev_page_url' => $data->previousPageUrl(),
                    'links' => $this->generatePaginationLinks($data),
                ]
            ]);
        }
    }

    // ===================================================
    public function storeSemiFinal(Request $request)
    {
        $request->validate([
            'user_id' => 'required|exists:users,id',
            'match_id' => 'required', // Ensure match exists
            'teams' => 'required|string', // Teams should be a valid JSON string
        ]);

        $teams = json_decode($request->teams, true);

        foreach ($teams as $team) {
            // Check if entry already exists
            $exists = SemiFinal::where('match_id', $request->match_id)
                ->where('team_id', $team['team_id'])
                ->where('user_id', $request->user_id)
                ->exists();

            if (!$exists) {
                SemiFinal::create([
                    'user_id' => $request->user_id,
                    'match_id' => $request->match_id,
                    'team_id' => $team['team_id'],
                    'match' => $team['match'],
                    'win' => $team['win'],
                    'los' => $team['los'],
                    'tie' => $team['tie'],
                    'pts' => $team['pts'],
                    'status' => '1',
                ]);
            } else {

                return response()->json(['error' => 'Allready Exists!'], 401);
            }
        }

        return response()->json(['message' => 'Semi-final predictions saved successfully!'], 201);
    }


    public function storeSemiFinalResult(Request $request)
    {
        $request->validate([
            'match_id' => 'required',
            'teams' => 'required|string', // Validate teams as a JSON string
        ]);

        $teams = json_decode($request->teams, true);
        $alreadyExists = [];

        foreach ($teams as $team) {
            $exists = SemiFinalResult::where('match_id', $request->match_id)
                ->where('team_id', $team['team_id'])
                ->exists();

            if (!$exists) {
                SemiFinalResult::create([
                    'match_id' => $request->match_id,
                    'team_id' => $team['team_id'],
                    'match' => $team['match'],
                    'win' => $team['win'],
                    'los' => $team['los'],
                    'tie' => $team['tie'],
                    'pts' => $team['pts'],
                    'status' => '1',
                ]);
            } else {
                $alreadyExists[] = $team['team_id'];
            }
        }

        if (!empty($alreadyExists)) {
            return response()->json([
                'error' => 'Some teams already exist.',
                'existing_teams' => $alreadyExists
            ], 409); // 409 Conflict
        }

        return response()->json(['message' => 'Semi-final predictions saved successfully!'], 201);
    }


    /**
     * Store a final prediction.
     */
    public function storeFinal(Request $request)
    {
        $validatedData = $request->validate([
            'user_id' => 'required|integer',
            'match_id' => 'required|integer',
            'team_one' => 'required|integer',
            'team_two' => 'required|integer|different:team_one',
            'hwt' => 'required|integer|min:0',
            'hs' => 'required|integer|min:0',
        ]);

        // Check if a final prediction already exists for this user and match
        $exists = Finalist::where('user_id', $request->user_id)
            ->where('match_id', $request->match_id)
            ->exists();

        if ($exists) {
            return response()->json([
                'error' => 'You have already submitted a final prediction for this match.'
            ], 409); // 409 Conflict
        }

        // Create prediction if not exists
        $prediction = Finalist::create([
            'match_id' => $request->match_id,
            'user_id' => $request->user_id,
            'team_one' => $request->team_one,
            'team_two' => $request->team_two,
            'hwt' => $request->hwt,
            'hs' => $request->hs,
            'status' => 1,
        ]);

        return response()->json([
            'message' => 'Final prediction saved!',
            'prediction' => $prediction
        ]);
    }

    /**
     * Store a final prediction result.
     */
    public function storeFinalresult(Request $request)
    {
        $validatedData = $request->validate([
            'match_id' => 'required|integer',
            'team_one' => 'required|integer',
            'team_two' => 'required|integer|different:team_one',
            'hwt' => 'required|integer|min:0',
            'hs' => 'required|integer|min:0',
        ]);

        // Manual check
        $exists = FinalistResult::where('match_id', $request->match_id)->exists();

        if ($exists) {
            return response()->json([
                'error' => 'Final result already exists for this match.'
            ], 409); // 409 Conflict
        }

        $prediction = FinalistResult::create([
            'match_id' => $request->match_id,
            'team_one' => $request->team_one,
            'team_two' => $request->team_two,
            'hwt' => $request->hwt,
            'hs' => $request->hs,
            'status' => 1,
        ]);

        return response()->json([
            'message' => 'Final prediction result saved!',
            'prediction' => $prediction
        ]);
    }


    /**
     * Store a champion prediction.
     */
    public function storeChampion(Request $request)
    {
        $validatedData = $request->validate([
            'user_id' => 'required|integer',
            'match_id' => 'required|integer',
            'team_id' => 'required|integer',
            'mom' => 'required|integer',
            'mot' => 'required|integer|min:0',
        ]);

        $exists = Champion::where('user_id', $request->user_id)
            ->where('match_id', $request->match_id)
            ->exists();

        if ($exists) {
            return response()->json([
                'error' => 'You have already submitted a champion prediction for this match.'
            ], 409);
        }

        $prediction = Champion::create([
            'match_id' => $request->match_id,
            'user_id' => $request->user_id,
            'team_id' => $request->team_id,
            'mom' => $request->mom,
            'mot' => $request->mot,
        ]);

        return response()->json([
            'message' => 'Champion prediction saved!',
            'prediction' => $prediction
        ]);
    }

    /**
     * Store a champion prediction result.
     */
    public function storeChampionresult(Request $request)
    {
        $validatedData = $request->validate([
            'match_id' => 'required|integer',
            'team_id' => 'required|integer',
            'mom' => 'required|integer',
            'mot' => 'required|integer|min:0',
        ]);

        $exists = ChampionResult::where('match_id', $request->match_id)->exists();

        if ($exists) {
            return response()->json([
                'error' => 'Champion result already exists for this match.'
            ], 409);
        }

        $prediction = ChampionResult::create([
            'match_id' => $request->match_id,
            'team_id' => $request->team_id,
            'mom' => $request->mom,
            'mot' => $request->mot,
        ]);

        return response()->json([
            'message' => 'Champion result saved!',
            'prediction' => $prediction
        ]);
    }


    /**
     * Show semi-final predictions for a specific user.
     */
    public function showSemiFinal($user_id)
    {
        return response()->json(
            SemiFinal::where('user_id', $user_id)->where('type', 'semi_final')->get()
        );
    }

    /**
     * Show final predictions for a specific user.
     */
    public function showFinal($user_id)
    {
        return response()->json(
            Finalist::where('user_id', $user_id)->where('type', 'final')->get()
        );
    }

    /**
     * Show champion predictions for a specific user.
     */
    public function showChampion($user_id)
    {
        return response()->json(
            Champion::where('user_id', $user_id)->where('type', 'champion')->get()
        );
    }

    /**
     * Get users who have made predictions in semi-final, final, and champion.
     */
    public function getUsersWithPredictions(Request $request)
    {
        $matchId = $request->match_id; // Get match_id from request

        $users = User::whereHas('semiFinalPredictions', function ($query) use ($matchId) {
            $query->where('match_id', $matchId);
        })
            ->whereHas('finalPredictions', function ($query) use ($matchId) {
                $query->where('match_id', $matchId);
            })
            ->whereHas('championPredictions', function ($query) use ($matchId) {
                $query->where('match_id', $matchId);
            })
            ->get(); // Add more fields if needed

        return response()->json([
            'message' => 'Users who made predictions in all categories for match ID ' . $matchId,
            'users' => $users
        ]);
    }


    public function tournamentPlayers(request $request)
    {

        // dd($request->team_id);

        $data = TournamentTeamsPlayers::where('tournament_id', $request->match_id)->with(['player'])->get();

        // dd($data);
        return response()->json($data);
    }
    public function getUserPredictions($userId)
    {
        $semiFinalPredictions = SemiFinal::where('user_id', $userId)
            ->with(['team.team'])
            ->get();
        $finalPredictions = Finalist::where('user_id', $userId)
            ->with(['teamOne.team', 'teamTwo.team', 'hwt.player', 'hs.player'])
            ->first();
        $championPredictions = Champion::where('user_id', $userId)
            ->with(['team.team', 'mom.player', 'mot.player'])
            ->first();

        if ($semiFinalPredictions->isEmpty() && $finalPredictions->isEmpty() && $championPredictions->isEmpty()) {
            return response()->json([
                'message' => 'No predictions found for this user'
            ], 404);
        }

        return response()->json([
            'message' => 'User prediction data',
            'semi_final' => $semiFinalPredictions,
            'final' => $finalPredictions,
            'champion' => $championPredictions
        ]);
    }
    public function singleMatch()
    {
        $data = MatchList::orderby('id', "desc")->with(["teamA", "teamB"])->first();

        if ($data) {
            $baseUrl = url('uploads/'); // Adjust the path if necessary
            $data->image = url($data->image);

            // Append full image URL to teamA and teamB
            $data->teamA->image = $baseUrl . '/' . $data->teamA->image;
            $data->teamB->image = $baseUrl . '/' . $data->teamB->image;
        }

        return response()->json($data);
    }
    public function CheckMatchPrediction(request $request)
    {
        $data = singleMatchReport::where("user_id", $request->user_id)->where("match_id", $request->match_id)->first();

        return response()->json($data);
    }
    public function lastTournament(Request $request)
    {
        $data = Tournament::orderBy('id', 'desc')
            ->with(['teams.team', 'teams.players.player'])
            ->first();

        if ($data) {
            $baseUrl = url('uploads/');

            foreach ($data->teams as $teamData) {
                if ($teamData->team) {
                    $teamData->team->image = $baseUrl . '/' . $teamData->team->image;
                }
            }
        }

        return response()->json($data);
    }

    public function SaveTournamentReport(Request $request)
    {
        // Validate incoming request
        $validatedData = $request->validate([
            'user_id' => 'required|integer',
            'match_id' => 'required|integer',
            'win_team_id' => 'required|integer',
            'win_play_1' => 'required|integer',
            'win_play_2' => 'required|integer',
            'final_team_1' => 'required|integer',
            'final_team_2' => 'required|integer',
            'final_HWT' => 'required|integer',
            'final_HS' => 'required|integer',
            'SemiFinal' => 'required|array',
            'SemiFinal.*.team' => 'required|integer',
            'SemiFinal.*.matches' => 'required|integer',
            'SemiFinal.*.wins' => 'required|integer',
            'SemiFinal.*.losses' => 'required|integer',
            'SemiFinal.*.ties' => 'required|integer',
            'SemiFinal.*.points' => 'required|integer',
        ]);

        try {
            // Store SemiFinal data
            foreach ($request->SemiFinal as $team) {
                SemiFinal::create([
                    'user_id' => $request->user_id,
                    'match_id' => $request->match_id,
                    'team_id' => $team['team'],
                    'match' => $team['matches'],
                    'win' => $team['wins'],
                    'los' => $team['losses'],
                    'tie' => $team['ties'],
                    'pts' => $team['points'],
                    'status' => '1',
                ]);
            }

            // Store Finalist data
            Finalist::create([
                'user_id' => $request->user_id,
                'match_id' => $request->match_id,
                'team_one' => $request->final_team_1,
                'team_two' => $request->final_team_2,
                'hwt' => $request->final_HWT,
                'hs' => $request->final_HS,
                'status' => '1',
            ]);

            // Store Champion data
            Champion::create([
                'user_id' => $request->user_id,
                'match_id' => $request->match_id,
                'team_id' => $request->win_team_id,
                'mom' => $request->win_play_1,
                'mot' => $request->win_play_2,
                'status' => '1',
            ]);

            // if ($batsman != null) {
            $settings = SiteSetting::first();
            $user = User::where('id', $request->user_id)->first();
            $creadit = $user->Credit_Points;
            $total = $settings->tournament_bonus + $creadit;
            $user->update([
                'Credit_Points' => $total,
            ]);
            // }

            return response()->json([
                'success' => true,
                'message' => 'Tournament report saved successfully.',
            ], 201);
        } catch (\Exception $e) {
            return response()->json([
                'error' => true,
                'message' => 'Failed to save tournament report.',
                'exception' => $e->getMessage(),
            ], 500);
        }
    }

    public function predictMatchget()
    {
        $data = PredictMatch::orderBy('id', 'desc')->with(["teams", "teams.country"])->first();
        if ($data) {
            $baseUrl = url('uploads/');

            foreach ($data->teams as $teamData) {
                if ($teamData->country) {
                    $teamData->country->image = $baseUrl . '/' . $teamData->country->image;
                }
            }

            $data->start_date = \Carbon\Carbon::parse($data->start_date)->format('d M Y h:i A');
            $data->end_date = \Carbon\Carbon::parse($data->end_date)->format('d M Y h:i A');
        }
        return response()->json($data);
    }
    public function userbollerReport($id)
    {

        $data = PredictMatch::with(['Boller', 'Batsman', 'teams.country'])
            ->whereHas('Boller', function ($query) use ($id) {
                $query->where('user_id', $id);
            })
            ->orWhereHas('Batsman', function ($query) use ($id) {
                $query->where('user_id', $id);
            })
            ->get();
        return response()->json($data);
    }


    public function UserBollBat(Request $request)
    {
        $match_id = $request->match_id;
        $id = $request->user_id;

        $data = PredictMatch::with([
            'Boller.TeamPlayers.player.team',
            'Batsman.TeamPlayers.player.team',
            'teams.country'
        ])
            ->where('id', $match_id)
            ->where(function ($query) use ($id) {
                $query->whereHas('Boller', function ($subQuery) use ($id) {
                    $subQuery->where('user_id', $id);
                })
                    ->orWhereHas('Batsman', function ($subQuery) use ($id) {
                        $subQuery->where('user_id', $id);
                    });
            })
            ->first();

        if (!$data) {
            return response()->json([
                'success' => false,
                'message' => 'No data found for this match and user'
            ], 404);
        }

        return response()->json([
            'success' => true,
            'data' => $data
        ]);
    }

    public function predictCount(Request $request)
    {
        // Debug Request Data
        if (!$request->has(['match_id', 'teamA', 'teamB'])) {
            return response()->json([
                'success' => false,
                'message' => 'Missing required parameters'
            ], 400);
        }

        // Match ID Filtering Fix
        $dataA = singleMatchReport::where('match_id', $request->match_id)
            ->where('predict_team_id', $request->teamA)
            ->count();

        $dataB = singleMatchReport::where('match_id', $request->match_id)
            ->where('predict_team_id', $request->teamB)
            ->count();

        return response()->json([
            'success' => true,
            'team_a' => $dataA,
            'team_b' => $dataB,
        ]);
    }
    public function SingleMatchResult(request $request)
    {
        // dd($request->all());
        $validate = Validator::make($request->all(), [
            'match_id' => "required|unique:singlematchresult,match_id",
            'team_id' => "required",
        ]);
        if ($validate->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Validation failed',
                'errors' => $validate->errors()
            ], 422);
        }

        $save = SingleMatchResult::create([
            'match_id' => $request->match_id,
            'team_id' => $request->team_id,
        ]);


        return response()->json([
            'message' => 'Successfull',
        ]);
    }
    public function BatsmanResult(Request $request)
    {
        // Validate the incoming request
        $validate = Validator::make($request->all(), [
            "match_id" => "required|integer",
            "team_id" => "required|integer",
            "player_id" => "required|integer",
            "run" => "required|integer",
            "ball" => "required|integer",
            "four" => "required|integer",
            "six" => "required|integer"
        ]);

        if ($validate->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Validation failed',
                'errors' => $validate->errors()
            ], 422); // Return validation error status
        }

        if ($request->id) {
            // If `id` exists, we are in update mode
            $batsmanResult = BatsmanResult::find($request->id);  // Find the result by ID

            if (!$batsmanResult) {
                return response()->json([
                    'success' => false,
                    'message' => 'Batsman result not found for the provided ID.'
                ], 404); // Not Found status
            }

            // Update the batsman result with the new data
            $batsmanResult->update([
                'match_id' => $request->match_id,
                'team_id' => $request->team_id,
                'player_id' => $request->player_id,
                'run' => $request->run,
                'ball' => $request->ball,
                'total_4' => $request->four,
                'total_6' => $request->six,
            ]);

            return response()->json([
                'success' => true,
                'message' => 'Batsman result updated successfully!'
            ], 200); // HTTP 200 OK status for successful update
        } else {
            // If no `id` exists, we are in create mode
            // Check if the batsman result already exists for this match, team, and player
            $existingResult = BatsmanResult::where('match_id', $request->match_id)
                ->where('team_id', $request->team_id)
                ->where('player_id', $request->player_id)
                ->exists();

            if ($existingResult) {
                return response()->json([
                    'success' => false,
                    'message' => 'This playerâ€™s batting result is already recorded for this match and team.'
                ], 409); // HTTP 409 Conflict for already existing record
            }

            // Save a new batsman result if no existing record found
            BatsmanResult::create([
                'match_id' => $request->match_id,
                'team_id' => $request->team_id,
                'player_id' => $request->player_id,
                'run' => $request->run,
                'ball' => $request->ball,
                'total_4' => $request->four,
                'total_6' => $request->six,
            ]);

            return response()->json([
                'success' => true,
                'message' => 'Batsman result saved successfully!'
            ], 201); // HTTP 201 Created status for successful creation
        }
    }


    public function BollerResult(Request $request)
    {
        // Validate the incoming request
        $validate = Validator::make($request->all(), [
            "match_id" => "required|integer",
            "team_id" => "required|integer",
            "player_id" => "required|integer",
            "over" => "required|integer",
            "maden_over" => "required|integer",
            "run" => "required|integer",
            "wicket" => "required|integer"
        ]);

        // Return validation errors if validation fails
        if ($validate->fails()) {
            return response()->json([
                'success' => false,
                'message' => 'Validation failed',
                'errors' => $validate->errors()
            ], 422); // 422 Unprocessable Entity for validation errors
        }

        // If `id` exists, we are in update mode
        if ($request->id) {
            // Find the existing bowling result by ID
            $bowlerResult = BallerResult::find($request->id);

            // If the result doesn't exist, return a 404 Not Found
            if (!$bowlerResult) {
                return response()->json([
                    'success' => false,
                    'message' => 'Bowling result not found for the provided ID.'
                ], 404); // 404 Not Found
            }

            // Update the bowling result with the new data
            $bowlerResult->update([
                'match_id' => $request->match_id,
                'team_id' => $request->team_id,
                'player_id' => $request->player_id,
                'over' => $request->over,
                'maden_over' => $request->maden_over,
                'run' => $request->run,
                'wicket' => $request->wicket,
            ]);

            return response()->json([
                'success' => true,
                'message' => 'Bowling result updated successfully!'
            ], 200); // 200 OK status for successful update
        } else {
            // If no `id` is provided, we are in create mode

            // Check if the bowling result already exists for the match, team, and player
            $existingResult = BallerResult::where('match_id', $request->match_id)
                ->where('team_id', $request->team_id)
                ->where('player_id', $request->player_id)
                ->exists();

            // If the result already exists, return a 409 Conflict
            if ($existingResult) {
                return response()->json([
                    'success' => false,
                    'message' => 'This playerâ€™s bowling result is already recorded for this match and team.'
                ], 409); // 409 Conflict
            }

            // Create a new bowling result
            BallerResult::create([
                'match_id' => $request->match_id,
                'team_id' => $request->team_id,
                'player_id' => $request->player_id,
                'over' => $request->over,
                'maden_over' => $request->maden_over,
                'run' => $request->run,
                'wicket' => $request->wicket,
            ]);

            return response()->json([
                'success' => true,
                'message' => 'Bowling result saved successfully!'
            ], 201); // 201 Created status for successful creation
        }
    }


    public function viewSingleMatchResult($id)
    {
        $result = SingleMatchResult::where('match_id', $id)
            ->with('team')
            ->first();

        if (!$result) {
            return response()->json([
                'success' => false,
                'message' => 'Match result not found',
            ], 404);
        }

        // Append full image URL
        if ($result->team) {
            $result->team->image = url('uploads/' . $result->team->image);
        }

        return response()->json([
            'success' => true,
            'data' => $result,
        ]);
    }

    public function viewPredictMatchResult($id)
    {
        $result = BallerResult::where('match_id', $id)
            ->with(['team.country', 'TeamPlayers.player', 'match'])
            ->first();

        $result2 = BatsmanResult::where('match_id', $id)
            ->with(['team.country', 'TeamPlayers.player', 'match'])
            ->first();
        // $result3 = ChampionResult::where('match_id', $id)
        //     ->with(['team.country', 'match', 'mom', 'mot'])
        //     ->first();



        return response()->json([
            'success' => true,
            'boller' => $result,
            'batsman' => $result2,
            // 'champion' => $result3,
        ]);
    }

    public function singleWinner($id)
    {

        $winner = SingleMatchResult::where('match_id', $id)->first();

        $winner_team_id = $winner->team_id;

        $query = singleMatchReport::where('match_id', $id)->where('predict_team_id', $winner_team_id)->with(['user', 'team', 'match', 'match.teamA', 'match.teamB'])->get();
        // dd($query);
        return response()->json($query);
    }

    public function userData($id)
    {
        $user = User::where('id', $id)->first();
        return response()->json($user);
    }

    public function updateCp(Request $request)
    {
        $user = User::where('id', $request->user_id)->first();



        if ($user) {
            $user->update([
                'Credit_Points' => $request->cp
            ]);

            //  dd($user);

            return response()->json(['message' => 'Credit Points updated successfully.']);
        } else {
            return response()->json(['message' => 'User not found.'], 404);
        }
    }

    public function updateRun(request $request)
    {

        $run = MatchRun::where('user_id', $request->user_id)->where('match_id', $request->match_id)->first();

        // dd($run);


        if ($run) {
            $run->update([
                'run' => $request->run
            ]);

            return response()->json(['message' => 'Run updated successfully.']);
        } else {
            return response()->json(['message' => 'run not found.'], 404);
        }
    }

    public function getRun(request $request)
    {
        $run = MatchRun::where('user_id', $request->user_id)->where('match_id', $request->match_id)->first();

        return response()->json($run);
    }


    public function userpredictionrun(Request $request)
    {


        $winner = SingleMatchResult::where('match_id', $request->match_id)->first();

        $winner_team_id = $winner->team_id ?? null;


        if ($winner_team_id != null) {
            $query = singleMatchReport::where('match_report.match_id', $request->match_id)
                ->where('match_report.predict_team_id', $winner_team_id)
                ->join('match_run', function ($join) {
                    $join->on('match_report.match_id', '=', 'match_run.match_id')
                        ->on('match_report.user_id', '=', 'match_run.user_id');
                })
                ->with([
                    'user',
                    'result.team',
                    'team',
                    'match',
                    'match.teamA',
                    'match.teamB'
                ])
                ->select([
                    'match_report.*',
                    'match_run.run as run',
                ]);
        } else {
            $query = singleMatchReport::where('match_report.match_id', $request->match_id)
                ->join('match_run', function ($join) {
                    $join->on('match_report.match_id', '=', 'match_run.match_id')
                        ->on('match_report.user_id', '=', 'match_run.user_id');
                })
                ->with([
                    'user',
                    'result.team',
                    'team',
                    'match',
                    'match.teamA',
                    'match.teamB'
                ])
                ->select([
                    'match_report.*',
                    'match_run.run as run',
                ]);
        }

        if ($request->has('searchInput')) {
            $searchInput = $request->searchInput;

            $query->where(function ($q) use ($searchInput) {
                $q->whereHas('user', function ($teamQuery) use ($searchInput) {
                    $teamQuery->where('username', 'like', "%{$searchInput}%");
                });
            });
        }


        // $data = $query->orderBy('run', 'desc')->paginate($request->items ?? 10);
        $data = $query->orderByRaw('match_report.user_id = ? DESC', [$request->user_id])
            ->orderBy('run', 'desc')
            ->paginate($request->items ?? 10);


        // dd($data);

        return response()->json([
            'data' => $data->items(),
            'pagination' => [
                'current_page' => $data->currentPage(),
                'last_page' => $data->lastPage(),
                'per_page' => $data->perPage(),
                'total' => $data->total(),
                'next_page_url' => $data->nextPageUrl(),
                'prev_page_url' => $data->previousPageUrl(),
                'links' => $this->generatePaginationLinks($data),
            ]
        ]);
    }
    public function getResultStatus(request $request)
    {
        // dd($request->all());
        $data = SingleMatchResult::where('match_id', $request->match_id)->first();
        return response()->json($data);
    }



    public function singlematchWinners(request $request)
    {
        $winner = SingleMatchResult::where('match_id', $request->match_id)->first();

        $winner_team_id = $winner->team_id;
        $query = singleMatchReport::where('match_report.match_id', $request->id)
            ->where('match_report.predict_team_id', $winner_team_id)
            ->leftJoin('match_run', function ($join) {
                $join->on('match_report.match_id', '=', 'match_run.match_id')
                    ->on('match_report.user_id', '=', 'match_run.user_id');
            })
            ->with([
                'user',
                'result.team',
                'team',
                'match',
                'match.teamA',
                'match.teamB'
            ])
            ->select([
                'match_report.*',
                'match_run.run as run',
            ]);

        $data = $query->orderBy('run', 'desc')
            ->paginate($request->items ?? 10);


        // dd($data);

        return response()->json([
            'data' => $data->items(),
            'pagination' => [
                'current_page' => $data->currentPage(),
                'last_page' => $data->lastPage(),
                'per_page' => $data->perPage(),
                'total' => $data->total(),
                'next_page_url' => $data->nextPageUrl(),
                'prev_page_url' => $data->previousPageUrl(),
                'links' => $this->generatePaginationLinks($data),
            ]
        ]);
    }
    public function maxpredictmathwinner(Request $request)
    {
        $results = BallerResult::where('match_id', $request->id)->get();

        $matchedUsers = [];

        foreach ($results as $result) {
            $bollerQuery = Boller::with('user', 'TeamPlayers.player')
                ->where('match_id', $result->match_id)
                ->where('player_id', $result->player_id)
                ->where('over', $result->over)
                ->where('maden_over', $result->maden_over)
                ->where('run', $result->run)
                ->where('wicket', $result->wicket);

            if ($request->has('searchInput')) {
                $bollerQuery->whereHas('user', function ($query) use ($request) {
                    $query->where('username', 'like', '%' . $request->searchInput . '%');
                });
            }

            $boller = $bollerQuery->first();

            if ($boller && $boller->user) {
                $matchedUsers[] = [
                    'user'         => $boller->user,
                    'over'         => $boller->over,
                    'maden_over'   => $boller->maden_over,
                    'run'          => $boller->run,
                    'wicket'       => $boller->wicket,
                ];
            }
        }

        // Manual pagination logic
        $currentPage = (int) $request->input('page', 1);
        $perPage = (int) $request->input('items', 10);
        $total = count($matchedUsers);
        $lastPage = (int) ceil($total / $perPage);
        $offset = ($currentPage - 1) * $perPage;
        $paginatedData = array_slice($matchedUsers, $offset, $perPage);

        // Manual pagination links (array of page numbers with URLs)
        $paginationLinks = [];
        for ($page = 1; $page <= $lastPage; $page++) {
            $paginationLinks[] = [
                'url' => $page == $currentPage ? null : url()->current() . '?page=' . $page . '&items=' . $perPage,
                'label' => $page,
                'active' => $page == $currentPage,
            ];
        }

        return response()->json([
            'data' => $paginatedData,
            'pagination' => [
                'current_page' => $currentPage,
                'last_page' => $lastPage,
                'per_page' => $perPage,
                'total' => $total,
                'next_page_url' => $currentPage < $lastPage
                    ? url()->current() . '?page=' . ($currentPage + 1) . '&items=' . $perPage
                    : null,
                'prev_page_url' => $currentPage > 1
                    ? url()->current() . '?page=' . ($currentPage - 1) . '&items=' . $perPage
                    : null,
                'links' => $paginationLinks,
            ]
        ]);
    }



    public function maxpredictBatsmanmathwinner(Request $request)
    {
        $results = BatsmanResult::where('match_id', $request->id)->get();
        $matchedUsers = [];

        foreach ($results as $result) {
            $bollerQuery = Batsman::with('user', 'TeamPlayers.player')
                ->where('match_id', $result->match_id)
                ->where('player_id', $result->player_id)
                ->where('run', $result->run)
                ->where('ball', $result->ball)
                ->where('total_4', $result->total_4)
                ->where('total_6', $result->total_6);

            if ($request->has('searchInput')) {
                $bollerQuery->whereHas('user', function ($query) use ($request) {
                    $query->where('username', 'like', '%' . $request->searchInput . '%');
                });
            }

            $boller = $bollerQuery->first();

            if ($boller && $boller->user) {
                $matchedUsers[] = [
                    'user'         => $boller->user,
                    'run'          => $boller->run,
                    'ball'         => $boller->ball,
                    'total_4'      => $boller->total_4,
                    'total_6'      => $boller->total_6,
                ];
            }
        }

        return $this->paginateCustom($matchedUsers, $request);
    }

    public function TournamentWinnersUsers(Request $request)
    {
        $matchId = $request->match_id;

        $semiResults = SemiFinalResult::where('match_id', $matchId)->get();
        $finalResult = FinalistResult::where('match_id', $matchId)->first();
        $championResult = ChampionResult::where('match_id', $matchId)->first();

        if ($semiResults->isEmpty() || !$finalResult || !$championResult) {
            return response()->json([
                'message' => 'Result data is incomplete for match ID ' . $matchId
            ], 404);
        }

        $users = User::whereHas('semiFinalPredictions', fn($q) => $q->where('match_id', $matchId))
            ->whereHas('finalPredictions', fn($q) => $q->where('match_id', $matchId))
            ->whereHas('championPredictions', fn($q) => $q->where('match_id', $matchId))
            ->with([
                'semiFinalPredictions' => fn($q) => $q->where('match_id', $matchId),
                'finalPredictions' => fn($q) => $q->where('match_id', $matchId),
                'championPredictions' => fn($q) => $q->where('match_id', $matchId),
            ])
            ->get();

        $matchedUsers = [];

        foreach ($users as $user) {
            $userSemi = $user->semiFinalPredictions;
            $semiMatched = true;

            foreach ($semiResults as $actual) {
                $predicted = $userSemi->firstWhere('team_id', $actual->team_id);

                if (
                    !$predicted ||
                    $predicted->match != $actual->match ||
                    $predicted->win != $actual->win ||
                    $predicted->los != $actual->los ||
                    $predicted->tie != $actual->tie ||
                    $predicted->pts != $actual->pts
                ) {
                    $semiMatched = false;
                    break;
                }
            }

            $final = $user->finalPredictions->first();
            $finalMatched = $final &&
                $final->team_one == $finalResult->team_one &&
                $final->team_two == $finalResult->team_two &&
                $final->hwt == $finalResult->hwt &&
                $final->hs == $finalResult->hs;

            $champion = $user->championPredictions->first();
            $championMatched = $champion &&
                $champion->team_id == $championResult->team_id &&
                $champion->mom == $championResult->mom &&
                $champion->mot == $championResult->mot;

            if ($semiMatched && $finalMatched && $championMatched) {
                $matchedUsers[] = [
                    'user_id' => $user->id,
                    'username' => $user->username,
                    'name' => $user->name ?? '',
                    'email' => $user->email ?? '',
                ];
            }
        }

        return $this->paginateCustom($matchedUsers, $request, 'users');
    }


    private function paginateCustom(array $items, Request $request, $key = 'data')
    {
        $currentPage = (int) $request->input('page', 1);
        $perPage = (int) $request->input('items', 10);
        $total = count($items);
        $lastPage = (int) ceil($total / $perPage);
        $offset = ($currentPage - 1) * $perPage;
        $paginatedItems = array_slice($items, $offset, $perPage);

        $generatePaginationLinks = function ($currentPage, $lastPage, $perPage) {
            $links = [];

            for ($page = 1; $page <= $lastPage; $page++) {
                $links[] = [
                    'url' => url()->current() . '?page=' . $page . '&items=' . $perPage,
                    'label' => (string) $page,
                    'active' => $page == $currentPage,
                ];
            }

            return $links;
        };

        return response()->json([
            $key => $paginatedItems,
            'pagination' => [
                'current_page' => $currentPage,
                'last_page' => $lastPage,
                'per_page' => $perPage,
                'total' => $total,
                'next_page_url' => $currentPage < $lastPage
                    ? url()->current() . '?page=' . ($currentPage + 1) . '&items=' . $perPage
                    : null,
                'prev_page_url' => $currentPage > 1
                    ? url()->current() . '?page=' . ($currentPage - 1) . '&items=' . $perPage
                    : null,
                'links' => $generatePaginationLinks($currentPage, $lastPage, $perPage),
            ]
        ]);
    }
    public function showsetings()
    {
        $settings = SiteSetting::first();

        if (!$settings) {
            return response()->json([
                'message' => 'No settings found.',
                'data' => null
            ], 404);
        }

        // Add full logo URL if logo exists
        $settings->logo_url = $settings->logo_path ? url($settings->logo_path) : null;

        return response()->json($settings);
    }



    public function updatesetings(Request $request)
    {
        $settings = SiteSetting::first() ?? new SiteSetting();

        // ✅ Handle file upload
        if ($request->hasFile('logo')) {
            $logo = $request->file('logo');
            $imageName = time() . '.' . $logo->getClientOriginalExtension();
            $logo->move(public_path('uploads'), $imageName);
            $settings->logo_path = 'uploads/' . $imageName;
        }

        // ✅ Handle individual fields
        $settings->website_name        = $request->input('website_name');
        $settings->spin_creadit        = $request->input('spin_creadit');
        $settings->register_bonus      = $request->input('register_bonus');
        $settings->single_match_bonus  = $request->input('single_match_bonus');
        $settings->max_predict_bonus   = $request->input('max_predict_bonus');
        $settings->tournament_bonus    = $request->input('tournament_bonus');
        $settings->admin_email         = $request->input('admin_email');
        $settings->support_email       = $request->input('support_email');
        $settings->phone               = $request->input('phone');
        $settings->facebook            = $request->input('facebook');
        $settings->whatsapp            = $request->input('whatsapp');
        $settings->telegram            = $request->input('telegram');
        $settings->instagram           = $request->input('instagram');
        $settings->twitter             = $request->input('twitter');
        $settings->linkedin            = $request->input('linkedin');
        $settings->youtube             = $request->input('youtube');
        $settings->meta_title          = $request->input('meta_title');
        $settings->meta_description    = $request->input('meta_description');
        $settings->meta_keywords       = $request->input('meta_keywords');

        // ✅ Save the record
        $settings->save();

        // ✅ Add logo URL
        $settings->logo_url = $settings->logo_path ? asset($settings->logo_path) : null;

        return response()->json([
            'message' => 'Settings updated successfully',
            'data' => $settings
        ]);
    }
    public function storecreadit(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:100',
            'price' => 'required|numeric|min:0.01',
            'status' => 'required',
        ]);

        Credit::create([
            'user_id' => auth()->id(), // optional
            'name' => $validated['name'],
            'price' => $validated['price'],
            'status' => $validated['status'],
        ]);

        return response()->json(['message' => 'Credit added successfully']);
    }


    public function creditList(Request $request)
    {
        $query = Credit::query();


        if ($request->has('searchInput')) {
            $query->where('name', 'like', '%' . $request->searchInput . '%');
        }

        $data = $query->orderBy('id', 'desc')->paginate($request->items);

        $data->getCollection()->transform(function ($item) {
            $item->created = $item->created_at->format('d M Y h:i A');
            return $item;
        });
        // dd($data);

        return response()->json([
            'data' => $data->items(),
            'pagination' => [
                'current_page' => $data->currentPage(),
                'last_page' => $data->lastPage(),
                'per_page' => $data->perPage(),
                'total' => $data->total(),
                'next_page_url' => $data->nextPageUrl(),
                'prev_page_url' => $data->previousPageUrl(),
                'links' => $this->generatePaginationLinks($data),
            ]
        ]);
    }
    public function creditDetalis($id)
    {
        $data = Credit::where('id', $id)->first();
        return response()->json($data);
    }
    public function updatecreditDetalis(Request $request)
    {
        $validated = $request->validate([
            'id' => 'required|exists:credits,id',
            'name' => 'required|string|max:100',
            'price' => 'required|numeric|min:0.01',
            'status' => 'required',
        ]);

        $credit = Credit::find($validated['id']);
        $credit->update([
            'name' => $validated['name'],
            'price' => $validated['price'],
            'status' => $validated['status'],
        ]);

        return response()->json(['message' => 'Credit updated successfully']);
    }


    public function update_user_address(Request $request)
    {

        $validated = $request->validate([
            'id' => 'required',
            'paypal' => 'nullable',
        ]);

        // Find user
        $user = User::find($validated['id']);

        if (!$user) {
            return response()->json(['message' => 'User not found'], 404);
        }

        if ($request->filled('crypto')) {
            $user->update([
                'crypto_address' => $validated['crypto'],
            ]);
        }

        if ($request->filled('paypal')) {
            $user->update([
                'paypal_address' => $validated['paypal'],
            ]);
        }


        return response()->json(['message' => 'Profile updated successfully']);
    }

    public function updateUser(request $request)
    {


        $validated = $request->validate([
            'id' => 'required|exists:users,id',
            'name' => 'sometimes|string|max:100',
            'phone' => 'sometimes|string|max:20',
        ]);

        $user = User::find($validated['id']);

        if (!$user) {
            return response()->json(['message' => 'User not found'], 404);
        }

        $data = [];

        if ($request->filled('name')) {
            $data['name'] = $request->name;
        }

        if ($request->filled('phone')) {
            $data['phone'] = $request->phone;
        }


        if (!empty($data)) {
            $user->update($data);
        }


        return response()->json(['message' => 'Profile updated successfully']);
    }
}
