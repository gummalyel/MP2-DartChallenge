void main() {
  // Creating songs with duration in seconds
  Song song1 =
      Song("All Out of Love", "Air Supply", 241); // 4 minutes & 1 second
  Song song2 = Song(
      "When I Met You", "APO Hiking Society", 259); // 4 minutes & 19 seconds
  Song song3 = Song("(They Long To Be) Close To You", "Carpenters",
      284); // 4 minutes & 33 seconds
  Song song4 = Song("Stand By Me", "Ben E. King", 180); // 3 minutes
  Song song5 = Song(
      "Every Breathe You Take", "The Police", 253); // 4 minutes & 13 seconds
  Song song6 =
      Song("With A Smile", "Eraserheads", 278); // 4 minutes & 38 seconds
  Song song7 = Song("Sa Ngalan Ng Pag-Ibig", "December Avenue",
      285); // 4 minutes & 45 seconds
  Song song8 =
      Song("You'll Be Safe Here", "Rico Blanco", 304); // 5 minutes 4 seconds
  Song song9 = Song("Tadhana", "Up Dharma Down", 222); // 3 minutes & 42 seconds
  Song song10 = Song("Kathang Isip", "Ben&Ben", 318); // 5 minutes & 18 seconds
  Song song11 = Song(
      "A Thousand Miles", "Vanessa Carlton", 237); // 3 minutes & 57 seconds
  Song song12 =
      Song("When I Was Your Man", "Bruno Mars", 213); // 3 minutes & 33 seconds
  Song song13 =
      Song("Time After Time", "Cyndi Lauper", 241); // 4 minutes & 1 second
  Song song14 = Song("Collide", "Howie Day", 249); // 4 minutes & 9 seconds
  Song song15 = Song("Yellow", "Coldplay", 266); // 4 minutes & 26 seconds
  Song song16 = Song("Photograph", "Ed Sheeran", 258); // 4 minutes & 18 seconds

  // Creating stages a playlist
  Playlist classic = Playlist("Playlist: Classic Hits!");
  Playlist opm = Playlist("Playlist: Overrated O.P.M.");
  Playlist thebest = Playlist("Playlist: The Best!");

  // Adding songs to every playlist
  classic.addSong(song1);
  classic.addSong(song2);
  classic.addSong(song3);
  classic.addSong(song4);
  classic.addSong(song5);

  opm.addSong(song6);
  opm.addSong(song7);
  opm.addSong(song8);
  opm.addSong(song9);
  opm.addSong(song10);

  thebest.addSong(song6);
  thebest.addSong(song1);
  thebest.addSong(song11);
  thebest.addSong(song5);
  thebest.addSong(song12);
  thebest.addSong(song13);
  thebest.addSong(song14);
  thebest.addSong(song15);
  thebest.addSong(song9);
  thebest.addSong(song16);
  thebest.addSong(song8);

  // Creating a music festival
  MusicFestival festival = MusicFestival("G.I.D. ");

  // Adding stages to the festival
  festival.addStage(classic);
  festival.addStage(opm);
  festival.addStage(thebest);

  // Displaying the festival details
  festival.showFestival();
}

// Song class represents a single song
class Song {
  String title;
  String artist;
  int duration; // Duration of the song using seconds

  Song(this.title, this.artist, this.duration);

  // This is the method to get song details
  String getDetails() {
    int minutes = duration ~/ 60;
    int seconds = duration % 60;
    return "$title by $artist (Time: $minutes:${seconds.toString().padLeft(2, '0')})";
  }
}

// Playlist class represents a collection of songs
class Playlist {
  String name;
  List<Song> songs = [];

  Playlist(this.name);

  // Add a song to the playlist
  void addSong(Song song) {
    songs.add(song);
  }

  // Method to get the total duration of the playlist using seconds
  int getTotalDuration() {
    return songs.fold(0, (total, song) => total + song.duration);
  }

  // This is to display the playlist details
  void showPlaylist() {
    print("\n$name");
    print(""); // Adding space (I just add this for purposes)
    songs.forEach((song) => print(song.getDetails()));
    print(""); // Adding space
    int totalDuration = getTotalDuration();
    int minutes = totalDuration ~/ 60;
    int seconds = totalDuration % 60;
    print("Total Duration: $minutes minutes $seconds seconds\n");
  }
}

// MusicFestival class represents a music festival with multiple stages
class MusicFestival {
  String name;
  List<Playlist> stages = [];

  MusicFestival(this.name);

  // Adding a stage (playlist) to the festival
  void addStage(Playlist stage) {
    stages.add(stage);
  }

  // Getting the overall duration of all songs in the festival in seconds
  int getOverallDuration() {
    return stages.fold(0, (total, stage) => total + stage.getTotalDuration());
  }

  // This is to display the details of the entire festival
  void showFestival() {
    print("Welcome to $name Music Festival!\n");
    stages.forEach((stage) {
      stage.showPlaylist();
    });
    print("");
    int overallDuration = getOverallDuration();
    int minutes = overallDuration ~/ 60;
    int seconds = overallDuration % 60;
    print("Overall Festival Duration: $minutes minutes $seconds seconds");
  }
}
