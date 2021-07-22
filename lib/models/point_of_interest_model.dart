class PointOfInterest {
  String imageUrl; //
  String type; //
  String name; //
  String city; //
  double rating; //
  String address; //
  String description;
  String website; //
  String phoneNumber; //
  List<String> openingHours;
  List<double> location;

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
    this.openingHours,
    this.location,
  });
}

List<PointOfInterest> pointsOfInterest = [
  PointOfInterest(
    imageUrl: 'assets/images/thaikhun-bath.jpg',
    type: 'Restaurant',
    name: 'Thaikun',
    city: 'Bath',
    rating: 4.5,
    address: 'Block E/F Little Southgate, Bath BA1 1AQ',
    description:
        'Escape to the streets of Bangkok and enjoy Thai street food at Thaikhun Bath, located on Little Southgate. Expect a Thai taste adventure, Thai cocktails and the authentic Thai hospitality. Open everyday. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Purus sit amet volutpat consequat. Consectetur a erat nam at lectus urna. Sapien eget mi proin sed libero enim sed faucibus turpis. Dignissim enim sit amet venenatis urna cursus. A condimentum vitae sapien pellentesque habitant morbi tristique senectus et. Vel eros donec ac odio tempor. Mauris cursus mattis molestie a iaculis at erat. Amet consectetur adipiscing elit pellentesque habitant morbi tristique senectus et. Quam viverra orci sagittis eu volutpat odio facilisis mauris sit. A erat nam at lectus. Curabitur vitae nunc sed velit. Nibh cras pulvinar mattis nunc sed blandit libero volutpat sed.',
    website: 'https://www.thaikhun.co.uk/',
    phoneNumber: '01225 517025',
    openingHours: ['1:00 pm', '11:00 pm'],
    location: [51.384880, 2.361970],
  ),
  PointOfInterest(
    imageUrl: 'assets/images/bar-block.jpg',
    type: 'Restaurant',
    name: 'Bar & Block Steakhouse',
    city: 'Bristol',
    rating: 4.45,
    address: '4 James St W, Bath BA1 2BX',
    description:
        'Pop in and kick start your day with our tender steak + eggs for breakfast. Or sit back and enjoy one of our succulent steaks, available throughout the day ‘til late Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Purus sit amet volutpat consequat. Consectetur a erat nam at lectus urna. Sapien eget mi proin sed libero enim sed faucibus turpis. Dignissim enim sit amet venenatis urna cursus. A condimentum vitae sapien pellentesque habitant morbi tristique senectus et. Vel eros donec ac odio tempor. Mauris cursus mattis molestie a iaculis at erat. Amet consectetur adipiscing elit pellentesque habitant morbi tristique senectus et. Quam viverra orci sagittis eu volutpat odio facilisis mauris sit. A erat nam at lectus. Curabitur vitae nunc sed velit. Nibh cras pulvinar mattis nunc sed blandit libero volutpat sed.',
    website: 'https://www.barandblock.co.uk/en-gb',
    phoneNumber: '01225 123425',
    openingHours: ['9:00 am', '10:30 pm'],
    location: [51.452280, -2.593420],
  ),
  PointOfInterest(
    imageUrl: 'assets/images/menu-gordon-jones.jpg',
    type: 'Restaurant',
    name: 'Menu Gordon Jones',
    city: 'Bath',
    rating: 4.9,
    address: '2 Wellsway, Bath BA2 3AQ',
    description:
        'A surprise tasting menu by Gordon Jones. Experience contrasting flavours, textures and temperatures with English, Indian and Asian influences. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Purus sit amet volutpat consequat. Consectetur a erat nam at lectus urna. Sapien eget mi proin sed libero enim sed faucibus turpis. Dignissim enim sit amet venenatis urna cursus. A condimentum vitae sapien pellentesque habitant morbi tristique senectus et. Vel eros donec ac odio tempor. Mauris cursus mattis molestie a iaculis at erat. Amet consectetur adipiscing elit pellentesque habitant morbi tristique senectus et. Quam viverra orci sagittis eu volutpat odio facilisis mauris sit. A erat nam at lectus. Curabitur vitae nunc sed velit. Nibh cras pulvinar mattis nunc sed blandit libero volutpat sed.',
    website: 'https://menugordonjones.co.uk/#gordon-jones-home',
    phoneNumber: '01225 480871',
    openingHours: ['12:30 pm', '9:30 pm'],
    location: [51.374058, -2.366802],
  ),
  PointOfInterest(
    imageUrl: 'assets/images/opa-bath.jpg',
    type: 'Restaurant',
    name: 'Opa Bath',
    city: 'Bath',
    rating: 4.4,
    address: '2 Wellsway, Bath BA2 3AQ',
    description:
        'We have a true passion for traditional Greek food, every last week of the month we’ll be visiting a different Greek island to acknowledge the different and unique tastes each has to offer. Do you have a favourite Greek island? Join us as we introduce our new menus and tell us about your most memorable Greek dishes.',
    website: 'https://opabath.com/',
    phoneNumber: '01225 4560871',
    openingHours: ['12:30 pm', '9:30 pm'],
    location: [51.380656, -2.355705],
  ),
  PointOfInterest(
    imageUrl: 'assets/images/sotto.jpg',
    type: 'Restaurant',
    name: 'Sotto Sotto',
    city: 'Bath',
    rating: 4.9,
    address: '10 N Parade, Bath BA2 4AL',
    description:
        'Sotto sotto...Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Purus sit amet volutpat consequat. Consectetur a erat nam at lectus urna. Sapien eget mi proin sed libero enim sed faucibus turpis. Dignissim enim sit amet venenatis urna cursus. A condimentum vitae sapien pellentesque habitant morbi tristique senectus et. Vel eros donec ac odio tempor. Mauris cursus mattis molestie a iaculis at erat. Amet consectetur adipiscing elit pellentesque habitant morbi tristique senectus et. Quam viverra orci sagittis eu volutpat odio facilisis mauris sit. A erat nam at lectus. Curabitur vitae nunc sed velit. Nibh cras pulvinar mattis nunc sed blandit libero volutpat sed.',
    website: 'https://sottosotto.co.uk',
    phoneNumber: '01225 4560871',
    openingHours: ['12:30 pm', '9:30 pm'],
    location: [51.380671, 2.356596],
  ),
  PointOfInterest(
    imageUrl: 'assets/images/curry-garden.jpg',
    type: 'Restaurant',
    name: 'Curry Garden',
    city: 'Bath',
    rating: 3.2,
    address: '41A Upper Bloomfield Rd, Odd Down, Bath BA2 2RY',
    description:
        'Curry garden....Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Purus sit amet volutpat consequat. Consectetur a erat nam at lectus urna. Sapien eget mi proin sed libero enim sed faucibus turpis. Dignissim enim sit amet venenatis urna cursus. A condimentum vitae sapien pellentesque habitant morbi tristique senectus et. Vel eros donec ac odio tempor. Mauris cursus mattis molestie a iaculis at erat. Amet consectetur adipiscing elit pellentesque habitant morbi tristique senectus et. Quam viverra orci sagittis eu volutpat odio facilisis mauris sit. A erat nam at lectus. Curabitur vitae nunc sed velit. Nibh cras pulvinar mattis nunc sed blandit libero volutpat sed.',
    website: 'thenewcurrygarden.co.uk',
    phoneNumber: '01225 4560571',
    openingHours: ['12:30 pm', '9:30 pm'],
    location: [51.357251, -2.381101],
  ),
];
