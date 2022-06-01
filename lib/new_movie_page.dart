import 'package:flutter/material.dart';

class NewMoviePage extends StatefulWidget {
  const NewMoviePage({Key? key}) : super(key: key);

  @override
  State<NewMoviePage> createState() => _NewMoviePageState();
}

class _NewMoviePageState extends State<NewMoviePage> {
  final _nameController = TextEditingController();
  final _subtitleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _ratingController = TextEditingController();


  @override
  void dispose() {
    _nameController.dispose();
    _subtitleController.dispose();
    _descriptionController.dispose();
    _ratingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Movie'),
      ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText:'Movie Name',
                fillColor: Colors.grey.shade300,
                filled: true
              ),
              validator: (value) {
                if(value == null || value.isEmpty){
                  return 'This field must not be empty';
                }
                return null;
              },
            ),
            const SizedBox(height: 5,),
            TextFormField(
              controller: _subtitleController,
              decoration: InputDecoration(
                  labelText:'Movie Subtitle',
                  fillColor: Colors.grey.shade300,
                  filled: true
              ),
              validator: (value) {
                if(value == null || value.isEmpty){
                  return 'This field must not be empty';
                }
                return null;
              },
            ),
            const SizedBox(height: 5,),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: _ratingController,
              decoration: InputDecoration(
                  labelText:'Rating',
                  fillColor: Colors.grey.shade300,
                  filled: true
              ),
              validator: (value) {
                if(value == null || value.isEmpty){
                  return 'This field must not be empty';
                }
                return null;
              },
            ),
            const SizedBox(height: 5,),
            TextFormField(
              maxLines: 3,
              controller: _descriptionController,
              decoration: InputDecoration(
                  labelText:'Description',
                  fillColor: Colors.grey.shade300,
                  filled: true
              ),
              validator: (value) {
                if(value == null || value.isEmpty){
                  return 'This field must not be empty';
                }
                return null;
              },
            ),
            const SizedBox(height: 5,),
          ],
        ),
      ),
    );
  }
}
