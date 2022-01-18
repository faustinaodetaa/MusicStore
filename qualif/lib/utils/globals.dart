import 'package:qualif/models/comments.dart';
import 'package:qualif/models/items.dart';

var darkTheme = false;
var currUser;

var items = [
  Items(
      'drum.png',
      'DRUM DW JAZZ SERIES',
      'Inspired by the American drum sounds of the late 70’s and early 80’s, the Jazz Series shells feature a thick gumwood core that can be combined with maple, mahogany, or cherry inner and outer plies.',
      'IDR 4.500.000,00'),
  Items(
      'guitar.png',
      'TAYLOR GUITAR',
      'Each series features a unique combination of tonewoods and aesthetic details, which add up to a diverse mix of musical personalities.',
      'IDR 1.500.000,00'),
  Items(
      'harmonica.png',
      'SUZUKI HA-20-C HARMONICA',
      'The HA-20 harmonica carries the colored Hammond logo, which looks great against its black shell.',
      'IDR 300.000,00'),
  Items(
      'piano.png',
      'STEINWAY & SONS PIANO',
      'A masterpiece of artistry and engineering in your home, SPIRIO enables you to enjoy performances captured by great pianists — played with such nuance, power and passion that it is utterly indistinguishable from a live performance.',
      'IDR 20.000.000,00'),
  Items(
      'trumpet.png',
      'YAMAHA TRUMPET',
      'The sound of our golden trumpet will make everyone blown away by its beautiful sound.',
      'IDR 8.000.000,00'),
  Items(
      'violin.png',
      'STENTOR VIOLIN',
      'Carved with love and built from solid tonewoods, from the initial instrument shape to the finer details.',
      'IDR 2.000.000,00'),
];

var comments = [
  Comments('faustina', 'DRUM DW JAZZ SERIES', 'Cool drum!'),
  Comments('odeta', 'DRUM DW JAZZ SERIES',
      'I can be a drummer with that cool drum!'),
  Comments('fatgiggle22', 'STEINWAY & SONS PIANO', 'Cool Piano!'),
  Comments('yummypizza', 'STENTOR VIOLIN', 'The violin is so cool!')
];
