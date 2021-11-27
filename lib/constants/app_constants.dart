const List<String> trackConditions = ['Dry', 'Wet'];

const List<String> tracks = [
  'Barcelona',
  'Brands Hatch',
  'Donington',
  'Hungaroring',
  'Imola',
  'Kyalami',
  'Laguna Seca',
  'Misano',
  'Monza',
  'Mount Panorama',
  'Nurburgring',
  'Oulton Park',
  'Paul Ricard',
  'Silverstone',
  'Snetterton',
  'Spa-Francorchamps',
  'Suzuka',
  'Zandvoort',
  'Zolder'
];

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
  '18': 'Lamborghini Huracan SuperTrofeo',
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

const Map<String, List<int>> classes = {
  'GT3': [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    30,
  ],
  'GT4': [50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61],
  'ST': [18],
  'Cup': [9],
};
