class User{
final String name;
final String id;
final String email;


const User({
required this.name,
required this.id,
required this.email,

});
  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "email": email,
   
      };


}