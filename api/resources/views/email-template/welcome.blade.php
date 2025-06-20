<!DOCTYPE html>
<html lang="en">


<!-- Mirrored from themes.pixelstrap.com/voxo/email-template/welcome.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 08 Nov 2023 08:24:15 GMT -->

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="icon" href="{{url('email/images/favicon.png')}}" type="image/x-icon">

    <title>Voxo | Email template </title>

    <link
        href="https://fonts.googleapis.com/css2?family=Rubik:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap"
        rel="stylesheet">



    <style type="text/css">
        body {
            text-align: center;
            margin: 0 auto;
            width: 650px;
            font-family: 'Rubik', sans-serif;
            background-color: #e2e2e2;
            display: block;
        }

        .mb-3 {
            margin-bottom: 30px;
        }

        ul {
            margin: 0;
            padding: 0;
        }

        li {
            display: inline-block;
            text-decoration: unset;
        }

        a {
            text-decoration: none;
        }

        h5 {
            margin: 10px;
            color: #777;
        }

        .text-center {
            text-align: center
        }

        .welcome-name h5 {
            font-weight: normal;
            margin: 10px 0 0;
            color: #232323;
            text-align: justify;
            line-height: 1.6;
            letter-spacing: 0.05em;
        }

        .welcome-details p span {
            color: #e22454;
            font-weight: 700;
            margin: 0 2px;
            text-decoration: underline;
        }

        .welcome-details p {
            font-weight: normal;
            font-size: 14px;
            color: #232323;
            line-height: 1.6;
            letter-spacing: 0.05em;
            margin: 0;
            text-align: justify;
        }

        .verify-button button {
            padding: 12px 30px;
            border: none;
            background-color: #e22454;
            color: #fff;
            font-weight: 500;
            font-size: 15px;
            letter-spacing: 1.3px;
            border-radius: 5px;
        }

        .how-work li {
            margin: 0 20px;
            color: #232323;
            position: relative;
        }

        .how-work li:after {
            content: '';
            position: absolute;
            top: 50%;
            left: -21px;
            width: 2px;
            height: 70%;
            background-color: #7e7e7e;
            transform: translateY(-50%);
        }

        .how-work li:first-child::after {
            content: none;
        }

        .main-bg-light {
            background-color: #fafafa;
        }
    </style>
</head>

<body style="margin: 20px auto;">
    <table align="center" border="0" cellpadding="0" cellspacing="0"
        style="background-color: white; width: 100%; box-shadow: 0px 0px 14px -4px rgba(0, 0, 0, 0.2705882353);-webkit-box-shadow: 0px 0px 14px -4px rgba(0, 0, 0, 0.2705882353);">
        <!-- <tbody>
            <tr>
                <td style="padding: 25px;">
                    <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tbody>
                            <tr class="header">
                                <td align="left" valign="top">
                                    <a href="https://pronay.top">
                                        <img src="https://picperf.io/https://laravelnews.s3.amazonaws.com/images/laravel-featured.png" class="main-logo" alt="logo">
                                    </a>
                                </td>
                                <td class="menu" align="right">
                                    <ul>
                                        <li style="display: inline-block;text-decoration: unset">
                                            <a href="https://pronay.top"
                                                style="text-transform: capitalize;color:#444;font-size:16px;margin-right:15px;text-decoration: none;">Home</a>
                                        </li>
                                    </ul>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table> -->

    <table align="center" border="0" cellpadding="0" cellspacing="0"
        style="background-color: white; width: 100%; padding: 0 30px; box-shadow: 0px 0px 14px -4px rgba(0, 0, 0, 0.2705882353);">
        <tbody>
            <tr>
                <!-- <td class="welcome-image mb-3" style="display: block;">
                    <img src="https://picperf.io/https://laravelnews.s3.amazonaws.com/images/laravel-featured.png" style="width: 100%; margin-top: 20px;" alt="">
                </td> -->

                <td class="welcome-name mb-3" style="text-align: left; display: block;">
                    <h4 style="text-transform: capitalize; margin: 0; font-weight: 500; color: #232323">Welcome to Bigwin! </h4>
                    <p>Here Is you Verification Code : {{ $code }}</p>
                </td>

                <!-- <td class="verify-button mb-3" style="display: block;">
                    <button>Verify Email</button>
                </td> -->

                <td class="welcome-details mb-3" style="display: block;">
                    <p>If you have any question, please email us at <span>support@bigwin.com</span>
                    </p>
                </td>
            </tr>
        </tbody>
    </table>

</body>

</html>