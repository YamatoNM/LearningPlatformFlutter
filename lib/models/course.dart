class Course {
  final String title;
  final String author;
  final String price;
  final String hours;

  const Course({
    required this.title,
    required this.author,
    required this.price,
    required this.hours,
  });
}

const List<Course> sampleCourses = [
  Course(
    title: 'Flutter Widgets 101',
    author: 'Robertson Connie',
    price: '\$49',
    hours: '16 hours',
  ),
  Course(
    title: 'Dart for Beginners',
    author: 'Nguyen Shane',
    price: 'Free',
    hours: '9 hours',
  ),
  Course(
    title: 'State Management Basics',
    author: 'Bert Pullman',
    price: '\$59',
    hours: '14 hours',
  ),
  Course(
    title: 'Animations in Flutter',
    author: 'Mia Okafor',
    price: '\$39',
    hours: '7 hours',
  ),
];
