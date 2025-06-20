<?php

// app/Enums/Page.php
namespace App\Enums;

enum Page: string
{
    case SingleMatchPage = 'singleMatchPage';
    case MaxPredictPage = 'maxpredictPage';
    case WalletPage = 'walletPage';
    case WinnerPage = 'winnerPage';
    case ProfilePage = 'profilePage';
}
