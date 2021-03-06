import 'package:flutter/material.dart';

const String thankYouForInstalling =
    'I am Jake, a University Student studying Computer Science, this has been one of my personal projects to get started in app development. I never expected it to have around 5000 users! This is the 3rd time I have reworked the app, I hope you enjoy the improvements, and I am excited for future planned changes. One change that I can share is that in the near future the app will be able to save your data to the cloud, allowing your data to be saved and used across devices, as well as be synced with the web version for PC when it is released! The source code for this app is now public and the link can be found in the settings. I want to add a special thank you to those all over the world who have submitted translations for this app! Finally, if you find this app useful, it would mean a lot if you could leave a review! Once again, thank you!';

const githubRepo = 'https://github.com/jakecoombs/acc_fuel_app_flutter';
const suggestionLink = 'https://forms.gle/3b75dArtWMBtt3PT7';
const translationLink = 'https://forms.gle/Mmjq215Eapdg4YmM7';
const androidProVersion =
    'https://play.google.com/store/apps/details?id=com.accfuelcalcpro.accfuelcalculator';
const iosProVersion =
    'https://apps.apple.com/us/app/acc-fuel-calculator-pro/id1541953578';

const Map<String, ThemeMode> themes = {
  'light': ThemeMode.light,
  'dark': ThemeMode.dark,
  'system': ThemeMode.system
};

const Map<String, String> trackConditions = {
  '0': 'Dry',
  '1': 'Damp',
  '2': 'Wet',
};

const Map<String, String> tracks = {
  '0': 'Barcelona',
  '1': 'Brands Hatch',
  '2': 'Donington',
  '3': 'Hungaroring',
  '4': 'Imola',
  '5': 'Kyalami',
  '6': 'Laguna Seca',
  '7': 'Misano',
  '8': 'Monza',
  '9': 'Mount Panorama',
  '10': 'Nurburgring',
  '11': 'Oulton Park',
  '12': 'Paul Ricard',
  '13': 'Silverstone',
  '14': 'Snetterton',
  '15': 'Spa-Francorchamps',
  '16': 'Suzuka',
  '17': 'Zandvoort',
  '18': 'Zolder',
};

const Map<String, String> legacyCars = {
  '0': 'Porsche 991 GT3 R',
  '1': 'Mercedes-AMG GT3',
  '2': 'Ferrari 488 GT3',
  '3': 'Audi R8 LMS',
  '4': 'Lamborghini Huracan GT3',
  '5': 'McLaren 650S GT3',
  '6': 'Nissan GT-R Nismo GT3 2018',
  '7': 'BMW M6 GT3',
  '8': 'Bentley Continental GT3 2018',
  '9': 'Porsche 991 II GT3 Cup',
  '10': 'Nissan GT-R Nismo GT3 2017',
  '11': 'Bentley Continental GT3 2015',
  '12': 'Aston Martin Racing V12 Vantage',
  '13': 'Reiter Engineering R-EX GT3',
  '14': 'Emil Frey Jaguar GT3',
  '15': 'Lexus RC F GT3',
  '16': 'Lamborghini Huracan GT3 Evo',
  '17': 'Honda NSX GT3',
  '18': 'Lamborghini Huracan ST',
  '19': 'Audi R8 LMS Evo',
  '20': 'Aston Martin Racing V8 Vantage',
  '21': 'Honda NSX GT3 Evo',
  '22': 'McLaren 720S GT3',
  '23': 'Porsche 991 II GT3 R',
  '24': 'Ferrari 488 GT3 Evo',
  '25': 'Mercedes-AMG GT3 Evo',
  '30': 'BMW M4 GT3',
  '50': 'Alpine A110 GT4',
  '51': 'Aston Martin V8 Vantage GT4',
  '52': 'Audi R8 LMS GT4',
  '53': 'BMW M4 GT4',
  '55': 'Chevrolet Camaro GT4.R',
  '56': 'Ginetta G55 GT4',
  '57': 'KTM X-Bow GT4',
  '58': 'Maserati Granturismo MC GT4',
  '59': 'McLaren 570S GT4',
  '60': 'Mercedes-AMG GT4',
  '61': 'Porsche 718 Cayman GT4 Clubsport',
};

const Map<String, String> cars = {
  '0': 'Porsche 991 GT3 R',
  '1': 'Mercedes-AMG GT3',
  '2': 'Ferrari 488 GT3',
  '3': 'Audi R8 LMS',
  '4': 'Lamborghini Huracan GT3',
  '5': 'McLaren 650S GT3',
  '6': 'Nissan GT-R Nismo GT3 2018',
  '7': 'BMW M6 GT3',
  '8': 'Bentley Continental GT3 2018',
  '9': 'Porsche 991II GT3 Cup',
  '10': 'Nissan GT-R Nismo GT3 2017',
  '11': 'Bentley Continental GT3 2016',
  '12': 'Aston Martin V12 Vantage GT3',
  '13': 'Lamborghini Gallardo R-EX',
  '14': 'Jaguar G3',
  '15': 'Lexus RC F GT3',
  '16': 'Lamborghini Huracan Evo (2019)',
  '17': 'Honda NSX GT3',
  '18': 'Lamborghini Huracan ST',
  '19': 'Audi R8 LMS Evo (2019)',
  '20': 'AMR V8 Vantage (2019)',
  '21': 'Honda NSX Evo (2019)',
  '22': 'McLaren 720S GT3 (2019)',
  '23': 'Porsche 911II GT3 R (2019)',
  '24': 'Ferrari 488 GT3 Evo 2020',
  '25': 'Mercedes-AMG GT3 2020',
  '30': 'BMW M4 GT3',
  '50': 'Alpine A110 GT4',
  '51': 'AMR V8 Vantage GT4',
  '52': 'Audi R8 LMS GT4',
  '53': 'BMW M4 GT4',
  '55': 'Chevrolet Camaro GT4',
  '56': 'Ginetta G55 GT4',
  '57': 'KTM X-Bow GT4',
  '58': 'Maserati MC GT4',
  '59': 'McLaren 570S GT4',
  '60': 'Mercedes-AMG GT4',
  '61': 'Porsche 718 Cayman GT4',
};

const Map<String, List<String>> classes = {
  'GT3': [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '30',
  ],
  'GT4': [
    '50',
    '51',
    '52',
    '53',
    '55',
    '56',
    '57',
    '58',
    '59',
    '60',
    '61',
  ],
  'ST': [
    '18',
  ],
  'Cup': [
    '9',
  ],
};
