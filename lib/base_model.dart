import 'package:scoped_model/scoped_model.dart';


class BaseModel extends Model {
  /*
    От этой переменной будет зависеть, какой именно экран сейчас отображается:
    экран список или экран редактирования.
   */
  int stackIndex = 0;

  List entityList = [ ];

  // The entity being edited.
  var entityBeingEdited;

  String chosenDate = '';
  void setChosenDate(String inDate) {

    print("## BaseModel.setChosenDate(): inDate = $inDate");

    chosenDate = inDate;
    notifyListeners();
  }

  void loadData(String inEntityType, dynamic inDatabase) async {

    print("## ${inEntityType}Model.loadData()");

    // Load entities from database.
    entityList = await inDatabase.getAll();
    notifyListeners();
  }

  void setStackIndex(int inStackIndex) {

    print("## BaseModel.setStackIndex(): inStackIndex = $inStackIndex");

    stackIndex = inStackIndex;
    notifyListeners();
  }
}