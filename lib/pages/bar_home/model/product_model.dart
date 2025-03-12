// // ignore_for_file: must_be_immutable
//
// import 'package:equatable/equatable.dart';
//
// enum IncreaseDecrease { increase, decrease }
//
// class CartProductModel extends Equatable {
//   int id;
//   String name;
//   bool isCompare;
//   bool selected;
//   bool hasOffer;
//   int countInCart;
//   bool makeShake;
//   String title;
//   String subtitle;
//   String image;
//   String price;
//   String discount;
//   double rate;
//   List<Manufacturer> manufacturers=[];
//
//   CartProductModel({
//     required this.id,
//     this.name='Black Abiba',
//     this.image='https://media.gettyimages.com/id/938325632/photo/happy-baby.jpg?s=612x612&w=gi&k=20&c=xzcjid4KSaZ375mveliHs9ZCfx3kiDTCMX2DwFg7X4Y=',
//     this.selected = false,
//     this.isCompare = false,
//     this.hasOffer = false,
//     this.countInCart = 01,
//     this.makeShake = false,
//     this.title = "baby toys",
//     this.subtitle = "toys for baby 5 years",
//     this.price = "120",
//     this.discount = "200",
//     this.rate = 4.5,
//     required this.manufacturers,
//   });
//
//
//   @override
//   List<Object> get props => [hasOffer.toString(), selected.toString()];
//
//   @override
//   bool get stringify => true;
// }
