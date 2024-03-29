import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp/widgets/chatfeedcard.dart';

late List<CameraDescription> cameras;
List<Contact>? cnkts;
String kUser= "";

double kTabSize = 15;
Color kThemecolor = const Color(0xff00a783);
List<Contact> contacts = [];

List<String> kCountryList = [
  "Select Country","Afghanistan", "Albania", "Algeria", "American Samoa", "Andorra", "Angola", "Anguilla", "Antigua and Barbuda", "Argentina", "Armenia", "Aruba", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia", "Bosnia and Herzegovina", "Botswana", "Brazil", "Brunei Darussalam", "Bulgaria", "Burkina Faso", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde", "Cayman Islands", "Central African Republic", "Chad", "Chile", "China", "Christmas Island", "Cocos (Keeling) Islands", "Colombia", "Comoros", "Congo (Brazzaville)", "Congo (Kinshasa)", "Cook Islands", "Costa Rica", "Côte D'Ivoire (Ivory Coast)", "Croatia (Hrvatska)", "Cuba", "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Falkland Islands (Malvinas)", "Faroe Islands", "Fiji", "Finland", "France", "French Guiana", "French Polynesia", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Gibraltar", "Greece", "Greenland", "Grenada", "Guadeloupe", "Guam", "Guatemala", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Holy See (Vatican City State)", "Honduras", "Hong Kong, SAR", "Hungary", "Iceland", "India", "Indonesia", "Iran, Islamic Republic of", "Iraq", "Ireland", "Israel", "Italy", "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Korea, Democratic People's Republic of (North)", "Korea, Republic of (South)", "Kuwait", "Kyrgyzstan", "Laos (Lao PDR)", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libya", "Liechtenstein", "Lithuania", "Luxembourg", "Macao (SAR China)", "Macedonia, Republic of", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Martinique", "Mauritania", "Mauritius", "Mayotte", "Mexico", "Micronesia, Federated States of", "Moldova", "Monaco", "Mongolia", "Montenegro", "Montserrat", "Morocco and Western Sahara", "Mozambique", "Myanmar", "Namibia", "Nauru", "Nepal", "Netherlands", "Netherlands Antilles", "New Caledonia", "New Zealand", "Nicaragua", "Niger", "Nigeria", "Niue", "Norfolk Island", "Northern Mariana Islands", "Norway", "Oman", "Pakistan", "Palau", "Palestinian Territory, Occupied", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Pitcairn", "Poland", "Portugal", "Puerto Rico", "Qatar", "Réunion and Mayotte", "Romania", "Russian Federation", "Rwanda", "Saint Helena and also Tristan Da Cunha", "Saint Kitts and Nevis", "Saint Lucia", "Saint Pierre and Miquelon", "Saint Vincent and the Grenadines", "Samoa", "San Marino", "São Tomé and Principe", "Saudi Arabia", "Senegal", "Serbia", "Seychelles", "Sierra Leone", "Singapore", "Slovakia", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "Spain", "Sri Lanka", "Sudan", "Suriname", "Svalbard and Jan Mayen Islands", "Swaziland", "Sweden", "Switzerland", "Syrian Arab Republic (Syria)", "Taiwan, Republic of China", "Tajikistan", "Tanzania, United Republic of", "Thailand", "Timor-Leste", "Togo", "Tokelau", "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey", "Turkmenistan", "Turks and Caicos Islands", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "United States of America", "Uruguay", "Uzbekistan", "Vanuatu", "Venezuela (Bolivarian Republic of)", "Viet Nam", "Virgin Islands, British", "Virgin Islands, US", "Wallis and Futuna Islands", "Yemen", "Zambia", "Zimbabwe"
];

List<String> kPhoneCode = [
  "00","93","355","213","1","376","244","1","1","54","374","297","61","43","994","1","973","880","1","375","32","501","229","1","975","591","387","267","55","673","359","226","257","855","237","1","238","1","236","235","56","86","61","61","57","269","242","243","682","506","225","385","53","357","420","45","253","1","1","593","20","503","240","291","372","251","500","298","679","358","33","594","689","241","220","995","49","233","350","30","299","1","590","1","502","224","245","592","509","379","504","852","36","354","91","62","98","964","353","972","39","1","81","962","7","254","686","850","82","965","996","856","371","961","266","231","218","423","370","352","853","389","261","265","60","960","223","356","692","596","222","230","262","52","691","373","377","976","382","1","212","258","95","264","674","977","31","599","687","64","505","227","234","683","672","1","47","968","92","680","970","507","675","595","51","63","870","48","351","1","974","262","40","7","250","290","1","1","508","1","685","378","239","966","221","381","248","232","65","421","386","677","252","27","34","94","249","597","47","268","46","41","963","886","992","255","66","670","228","690","676","1","216","90","993","1","688","256","380","971","44","1","598","998","678","58","84","1","1","681","967","260","263"
];

var contactlen;



Map<String, dynamic> kNum = {"":""};

Map<dynamic,String> lstcht = {"":""};
String kStatuslink="";
