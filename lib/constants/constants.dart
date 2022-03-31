import 'dart:io';

import 'package:google_maps_flutter/google_maps_flutter.dart';

String get markerImg => Platform.isAndroid
    ? "assets/marker_small_2.png"
    : "assets/marker_small_1.png";

const String loadingAsset = "assets/loading.json";
const String appLogo = "assets/pharmate_logo.png";

double bearing = 192.8334901395799;
double zoom = 13.9;
double tilt = 59.440717697143555;

final CameraPosition initialCamPosition = const CameraPosition(
  target: LatLng(40.787822, -73.955618),
  zoom: 13.9,
  bearing: 192.8334901395799,
  tilt: 59.440717697143555,
);
const String drugDetail =
    'An indication is a term used for the list of condition or symptom or illness for which the medicine is prescribed or used by the patient. For example, acetaminophen or paracetamol is used for fever by the patient, or the doctor prescribes it for a headache or body pains. Now fever, headache and body pains are the indications of paracetamol.\n\nPO and IV \nProphylaxis of organ rejection in patients receiving allogenic liver, kidney, or heart transplants. Used in conjunction with adrenal corticosteroids. Used in conjunction with azathioprine or mycophenolate mofetil in heart and kidney transplant patients.\n\nTopical\nAs second-line therapy for the short-term and noncontinuous long-term treatment of moderate to severe atopic dermatitis.';
