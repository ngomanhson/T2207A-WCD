<%@ page import="wcd.jpa.entities.Student" %><%--
  Created by IntelliJ IDEA.
  User: ngomanhson
  Date: 01/02/2024
  Time: 14:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create a new Student!</title>
    <style>
        @media only screen and (max-width: 620px) {
            table[class="body"] h1 {
                font-size: 28px !important;
                margin-bottom: 10px !important;
            }

            table[class="body"] p,
            table[class="body"] ul,
            table[class="body"] ol,
            table[class="body"] td,
            table[class="body"] span,
            table[class="body"] a {
                font-size: 16px !important;
            }

            table[class="body"] .wrapper,
            table[class="body"] .article {
                padding: 10px !important;
            }

            table[class="body"] .content {
                padding: 0 !important;
            }

            table[class="body"] .container {
                padding: 0 !important;
                width: 100% !important;
            }

            table[class="body"] .main {
                border-left-width: 0 !important;
                border-radius: 0 !important;
                border-right-width: 0 !important;
            }

            table[class="body"] .btn table {
                width: 100% !important;
            }

            table[class="body"] .btn a {
                width: 100% !important;
            }

            table[class="body"] .img-responsive {
                height: auto !important;
                max-width: 100% !important;
                width: auto !important;
            }
        }

        @media all {
            .ExternalClass {
                width: 100%;
            }

            .ExternalClass,
            .ExternalClass p,
            .ExternalClass span,
            .ExternalClass font,
            .ExternalClass td,
            .ExternalClass div {
                line-height: 100%;
            }

            .apple-link a {
                color: inherit !important;
                font-family: inherit !important;
                font-size: inherit !important;
                font-weight: inherit !important;
                line-height: inherit !important;
                text-decoration: none !important;
            }

            .btn-primary table td:hover {
                background-color: #014486 !important;
            }

            .btn-primary a:hover {
                background-color: #014486 !important;
                border-color: #014486 !important;
            }
        }
    </style>
</head>
<body>
    <% Student student = (Student) request.getAttribute("student");%>

    <body class="" style="background-color: #f5f5f4; font-family: sans-serif; -webkit-font-smoothing: antialiased; font-size: 14px; line-height: 1.4; margin: 0; padding: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;">
    <table role="presentation" border="0" cellpadding="0" cellspacing="0" class="body" style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; background-color: #f5f5f4; width: 100%;" width="100%" bgcolor="#f5f5f4">
        <tr>
            <td style="font-family: sans-serif; font-size: 14px; vertical-align: top;" valign="top">&nbsp;</td>
            <td class="container" style="font-family: sans-serif; font-size: 14px; vertical-align: top; display: block; max-width: 580px; padding: 10px; width: 580px; Margin: 0 auto;" width="580" valign="top">
                <div class="header" style="padding: 10px 0;">
                    <table role="presentation" border="0" cellpadding="0" cellspacing="0" width="100%" style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; width: 100%;">
                        <tr>
                            <td class="align-center" width="100%" style="font-family: sans-serif; font-size: 14px; vertical-align: top; text-align: center;" valign="top" align="center">
                                <a href="https://" style="color: #0d9dda; text-decoration: underline;"><img src="https://image.exct.net/lib/fe641570776d02757515/m/4/SF-MC-logo_blue.png" height="80" alt="Salesforce Marketing Cloud" style="border: none; -ms-interpolation-mode: bicubic; max-width: 100%;"></a>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="content" style="box-sizing: border-box; display: block; Margin: 0 auto; max-width: 580px; padding: 10px;">
                    <!-- START CENTERED WHITE CONTAINER -->
                    <span class="preheader" style="color: transparent; display: none; height: 0; max-height: 0; max-width: 0; opacity: 0; overflow: hidden; mso-hide: all; visibility: hidden; width: 0;">This is preheader text. Some clients will show this text as a preview.</span>
                    <table role="presentation" class="main" style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; background: #ffffff; border-radius: 3px; width: 100%;" width="100%">
                        <!-- START MAIN CONTENT AREA -->
                        <tr>
                            <td class="wrapper" style="font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;" valign="top">
                                <table role="presentation" border="0" cellpadding="0" cellspacing="0" style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; width: 100%;" width="100%">
                                    <tr>
                                        <td style="font-family: sans-serif; font-size: 14px; vertical-align: top;" valign="top">
                                            <p style="font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; margin-bottom: 15px;">Hello <%= student.getName() %>.</p>
                                            <p style="font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; margin-bottom: 15px;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque congue dui lacinia porttitor accumsan. Ut eu euismod felis.</p>
                                            <p style="font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; margin-bottom: 15px;"><strong>Praesent luctus urna sit amet augue rhoncus congue.</strong></p>
                                            <p style="font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; margin-bottom: 15px;">Vivamus vehicula finibus felis, efficitur molestie mi tincidunt vel. Sed ligula felis, congue quis lorem in, consequat aliquam neque. Donec sit amet eros maximus, cursus est sit amet, imperdiet dolor.</p>
                                            <table role="presentation" border="0" cellpadding="0" cellspacing="0" class="btn btn-primary" style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; box-sizing: border-box; width: 100%;" width="100%">
                                                <tbody>
                                                <tr>
                                                    <td align="center" style="font-family: sans-serif; font-size: 14px; vertical-align: top; padding-bottom: 15px;" valign="top">
                                                        <table role="presentation" border="0" cellpadding="0" cellspacing="0" style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: auto; width: auto;">
                                                            <tbody>
                                                            <tr>
                                                                <td style="font-family: sans-serif; font-size: 14px; vertical-align: top; border-radius: 5px; text-align: center; background-color: #ffffff;" valign="top" align="center" bgcolor="#ffffff"> <a href="http://localhost:8080/T2207A_WCD_war_exploded/create-password?id=<%= student.getId()%>" target="_blank" style="border: solid 1px #0d9dda; border-radius: 5px; box-sizing: border-box; cursor: pointer; display: inline-block; font-size: 14px; font-weight: bold; margin: 0; padding: 10px 33px; text-decoration: none; text-transform: capitalize; background-color: #0d9dda; border-color: #0d9dda; color: #ffffff;">Log In To Your Account</a> </td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                            <p style="font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; margin-bottom: 15px;">Cras viverra, velit ut elementum fringilla, nisi mauris fermentum ante, eget malesuada ligula tellus id felis.</p>
                                            <p style="font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; margin-bottom: 15px;">Vivamus tincidunt lorem at erat tempor, <a href="#" target="_blank" style="color: #0176d3; font-size: 14px; font-weight: bold; text-decoration: underline;">at finibus est finibus</a>.</p>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <!-- END MAIN CONTENT AREA -->
                    </table>
                    <!-- START FOOTER -->
                    <div class="footer" style="clear: both; Margin-top: 10px; text-align: center; width: 100%;">
                        <table role="presentation" border="0" cellpadding="0" cellspacing="0" style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; min-width: 100%; width: 100%;" width="100%">
                            <tr>
                                <td class="content-block" style="font-family: sans-serif; vertical-align: top; padding-bottom: 10px; padding-top: 10px; color: #747474; font-size: 12px; text-align: center;" valign="top" align="center">
                                    <a href="#" style="text-decoration: underline; color: #747474; font-size: 12px; text-align: center;">Click to unsubscribe</a> &nbsp;|&nbsp; <a href="#" style="text-decoration: underline; color: #747474; font-size: 12px; text-align: center;">Manage preferences</a>
                                </td>
                            </tr>
                            <tr>
                                <td class="content-block" style="font-family: sans-serif; vertical-align: top; padding-bottom: 10px; padding-top: 10px; color: #747474; font-size: 12px; text-align: center;" valign="top" align="center">
                                    <span class="apple-link" style="color: #747474; font-size: 12px; text-align: center;">1111 MC Way, Columbus, Ohio 43240</span>
                                </td>
                            </tr>
                            <tr>
                                <td class="content-block">
                                    <a href="https://" target="_blank"><img title="Facebook" src="https://hoiqh.stripocdn.email/content/assets/img/social-icons/logo-gray/facebook-logo-gray.png" alt="Facebook" width="28" height="28" style="display:inline-block;border:0;outline:none;text-decoration:none;"></a> &nbsp;
                                    <a href="https://" target="_blank" style="font-weight:bold"><img title="Instagram" src="https://hoiqh.stripocdn.email/content/assets/img/social-icons/logo-gray/instagram-logo-gray.png" alt="Instagram" width="28" height="28" style="display:inline-block;border:0;outline:none;text-decoration:none;"></a> &nbsp;
                                    <a href="https://" target="_blank" style="font-weight:bold"><img title="Youtube" src="https://hoiqh.stripocdn.email/content/assets/img/social-icons/logo-gray/youtube-logo-gray.png" alt="Youtube" width="28" height="28" style="display:inline-block;border:0;outline:none;text-decoration:none;"></a> &nbsp;
                                    <a href="mailto:" target="_blank" style="font-weight:bold"><img title="Email" src="https://hoiqh.stripocdn.email/content/assets/img/other-icons/logo-gray/mail-logo-gray.png" alt="Email" width="28" height="28" style="display:inline-block;border:0;outline:none;text-decoration:none;"></a>
                                </td>
                            </tr>
                            <tr>
                                <td class="content-block powered-by" style="font-family: sans-serif; vertical-align: top; padding-bottom: 10px; padding-top: 10px; color: #747474; font-size: 11px; text-align: center;" valign="top" align="center">
                                    <a href="#" style="color: #747474; font-size: 11px; font-weight: 300; text-align: center; letter-spacing: -.75px; text-decoration: none;">Powered by Ngo Manh Son</a>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <!-- END FOOTER -->

                    <!-- END CENTERED WHITE CONTAINER -->
                </div>
            </td>
            <td style="font-family: sans-serif; font-size: 14px; vertical-align: top;" valign="top">&nbsp;</td>
        </tr>
    </table>
</body>
</html>
