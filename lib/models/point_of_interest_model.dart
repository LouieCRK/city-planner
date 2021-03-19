class PointOfInterest {
  String imageUrl;
  String type;
  String name;
  String city;
  int rating;
  String address;
  String description;
  String website;
  String phoneNumber;
  String email;
  List<String> openingHours;

  PointOfInterest({
    this.imageUrl,
    this.type,
    this.name,
    this.city,
    this.rating,
    this.address,
    this.description,
    this.website,
    this.phoneNumber,
    this.email,
    this.openingHours,
  });
}

List<PointOfInterest> pointsOfInterest = [
  PointOfInterest(
    imageUrl: 'assets/images/thaikhun-bath.jpg',
    type: 'Restaurant',
    name: 'Thaikun',
    city: 'Bath',
    rating: 4,
    address: 'Block E/F Little Southgate, Bath BA1 1AQ',
    description: 'Escape to the streets of Bangkok and enjoy Thai street food at Thaikhun Bath, located on Little Southgate. Expect a Thai taste adventure, Thai cocktails and the authentic Thai hospitality. Open everyday.',
    website: 'https://www.thaikhun.co.uk/thai-restaurant/bath',
    phoneNumber: '01225 517025',
    email: 'thaikun@hotmail.com',
    openingHours: ['1:00 pm', '11:00 pm'],
  ),
  PointOfInterest(
    imageUrl: 'assets/images/bar-block.jpg',
    type: 'Restaurant',
    name: 'Bar & Block Steakhouse',
    city: 'Bath',
    rating: 4,
    address: '4 James St W, Bath BA1 2BX',
    description: 'Pop in and kick start your day with our tender steak + eggs for breakfast. Or sit back and enjoy one of our succulent steaks, available throughout the day ‘til late',
    website: 'https://www.barandblock.co.uk/en-gb',
    phoneNumber: '01225 123425',
    email: 'bar-block@hotmail.com',
    openingHours: ['9:00 am', '10:30 pm'],
  ),
  PointOfInterest(
    imageUrl: 'assets/images/menu-gordon-jones.jpg',
    type: 'Restaurant',
    name: 'Menu Gordon Jones',
    city: 'Bath',
    rating: 5,
    address: '2 Wellsway, Bath BA2 3AQ',
    description: 'A surprise tasting menu by Gordon Jones. Experience contrasting flavours, textures and temperatures with English, Indian and Asian influences.',
    website: 'https://menugordonjones.co.uk/#gordon-jones-home',
    phoneNumber: '01225 480871',
    email: 'menu-gordon-jones@hotmail.com',
    openingHours: ['12:30 pm', '9:30 pm'],
  ),
  PointOfInterest(
    imageUrl: 'assets/images/opa-bath.jpg',
    type: 'Restaurant',
    name: 'Opa Bath',
    city: 'Bath',
    rating: 4,
    address: '2 Wellsway, Bath BA2 3AQ',
    description: 'opa opa.....',
    website: 'https://opabath.com/',
    phoneNumber: '01225 4560871',
    email: 'opabath@hotmail.com',
    openingHours: ['12:30 pm', '9:30 pm'],
  ),
  PointOfInterest(
    imageUrl: 'assets/images/sotto.jpg',
    type: 'Restaurant',
    name: 'Sotto Sotto',
    city: 'Bath',
    rating: 5,
    address: '10 N Parade, Bath BA2 4AL',
    description: 'Sotto sotto...italian blah blah',
    website: 'https://sottosotto.co.uk',
    phoneNumber: '01225 4560871',
    email: 'sottosottobath@hotmail.com',
    openingHours: ['12:30 pm', '9:30 pm'],
  ),
  PointOfInterest(
    imageUrl: 'assets/images/curry-garden.jpg',
    type: 'Restaurant',
    name: 'Curry Garden',
    city: 'Bath',
    rating: 4,
    address: '41A Upper Bloomfield Rd, Odd Down, Bath BA2 2RY',
    description: 'Curry garden....blah blah',
    website: 'thenewcurrygarden.co.uk',
    phoneNumber: '01225 4560571',
    email: 'currygardenbath@hotmail.com',
    openingHours: ['12:30 pm', '9:30 pm'],
  ),
];
