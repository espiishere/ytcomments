int i = 0;

String substring = "http";

Map<String, dynamic> yt0 = {
  "id": "EEEEEE",
  "vTitle": "Title",
  "thumbnail": "error.jpg",
  "userpic": "error.jpg",
  "username": "Username",
  "video":
      "https://www.youtube.com/watch?v=eBGIQ7ZuuiU&ab_channel=YouGotRickRolled",
  "like": "false",
  "dislike": "false",
};

Map<String, dynamic> yt1 = {
  "id": "TN4YEe",
  "vTitle": "Rise and Fall of ESPN",
  "thumbnail": "ESPN1.jpg",
  "userpic":
      "https://upload.wikimedia.org/wikipedia/en/thumb/a/a2/National_Football_League_logo.svg/1200px-National_Football_League_logo.svg.png",
  "username": "NFL Official",
  "video":
      "https://www.youtube.com/watch?v=cBP9n-4UOaA&ab_channel=ThatsGoodSports",
   "like": "false",
  "dislike": "false",
};
Map<String, dynamic> yt2 = {
  "id": "dRwVDR",
  "vTitle": "Pokemon 2023 Finals",
  "thumbnail": "Champ.jpg",
  "userpic": "pkmcompany.jpg",
  "username": "Pokemon Official",
  "video": "https://www.youtube.com/watch?v=eCdlOnKtKkQ&ab_channel=TheOfficialPok%C3%A9monYouTubechannel",
    "like": "false",
  "dislike": "false",
};
Map<String, dynamic> yt3 = {
  "id": "u5Vj8L",
  "vTitle": "Skyrush POV",
  "thumbnail": "Thumbnail3.jpg",
  "userpic": "WoodenCoaster.png",
  "username": "Coasters POVs",
  "video":
      "https://www.youtube.com/watch?v=llvaWdI3hLM&ab_channel=AmusementInsider",
   "like": "false",
  "dislike": "false",
};

List listVideos = [yt0, yt1, yt2, yt3];
Map<String, dynamic> currentVideo = listVideos[0];
var id = currentVideo['id'];
var vTitle = currentVideo["vTitle"];
var username = currentVideo["username"];
var userpic = currentVideo["userpic"];
var thumbnail = currentVideo["thumbnail"];
var video = currentVideo["video"];
var like = currentVideo["like"];
var dislike = currentVideo["dislike"];

