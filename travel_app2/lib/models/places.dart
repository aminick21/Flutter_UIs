
import 'package:travel_app2/models/user.dart';

enum StatusTag { popular, event }

class TravelPlaces {
  final String id;
  final String name;
  final TravelUser user;
  final StatusTag statusTag;
  final int shared;
  final int likes;
  final String locationDesc;
  final String desc;
  final List<String> imagesUrl;
  final List<String> collection;

  TravelPlaces(
      {required this.id,
      required this.name,
      required this.user,
      required this.statusTag,
      required this.shared,
      required this.likes,
      required this.locationDesc,
      required this.desc,
      required this.imagesUrl,
        required this.collection
      });

}

final List<TravelPlaces> places= [
  TravelPlaces(
      id: "1",
      name: "Barcelona",
      user:   users[1],
      statusTag: StatusTag.popular,
      shared: 2800,
      likes: 2100,
      locationDesc: "Barcelona, Spain",
      desc:"Barcelona, the vibrant capital of Catalonia, Spain, is a city that seamlessly blends history, art, and a lively modern atmosphere. Nestled along the northeastern coast of the Iberian Peninsula, Barcelona is famous for its unique architectural wonders designed by the iconic architect Antoni Gaudí, including the awe-inspiring Sagrada Família and the whimsical Park Güell. The city's charming streets are filled with lively markets, cozy cafes, and lively plazas, such as the bustling La Rambla. Barcelona's Mediterranean coastline offers beautiful beaches, perfect for relaxation and water activities.",
      imagesUrl: [
        "https://images.unsplash.com/photo-1511527661048-7fe73d85e9a4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=930&q=80",
        "https://images.unsplash.com/photo-1567544948021-2e715dc696b7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80",
        "https://images.unsplash.com/photo-1579282240050-352db0a14c21?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=652&q=80"
      ],
      collection: [
        'https://images.unsplash.com/photo-1561632669-7f55f7975606?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80',
        'https://images.unsplash.com/photo-1495562569060-2eec283d3391?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80',
        'https://images.unsplash.com/photo-1543783207-ec64e4d95325?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80',
        'https://images.unsplash.com/photo-1526697675318-89790adec369?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2835&q=80',
        'https://plus.unsplash.com/premium_photo-1688141871823-a7db8cdedb04?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80',
      ]
  ),

  TravelPlaces(
    id: "2",
    name: "Santorini",
    user: users[0],
    statusTag: StatusTag.popular,
    shared: 1500,
    likes: 850,
    locationDesc: "Santorini, Greece",
    desc:'Santorini is a breathtaking Greek island renowned for its stunning beauty and unique geography. Nestled in the Aegean Sea, the island is famous for its picturesque whitewashed buildings, cascading down steep cliffs overlooking a pristine azure sea. The result of a volcanic eruption in ancient times, Santorini boasts remarkable volcanic landscapes and beautiful sunsets that draw travelers from around the world. With its charming villages, crystal-clear waters, and rich history, Santorini is a dream destination for those seeking a mix of natural wonders and cultural delights.',
    imagesUrl: [
      "https://plus.unsplash.com/premium_photo-1688410049290-d7394cc7d5df?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80",
      "https://images.unsplash.com/photo-1563789031959-4c02bcb41319?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1374&q=80",
      "https://images.unsplash.com/photo-1613395877344-13d4a8e0d49e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80"
    ],
    collection: [
      'https://images.unsplash.com/photo-1603565816030-6b389eeb23cb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80',
      'https://images.unsplash.com/photo-1605707141131-aa742dcf4671?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
      'https://images.unsplash.com/photo-1555993539-1732b0258235?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80',
      'https://images.unsplash.com/photo-1506929562872-bb421503ef21?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=936&q=80',
      'https://images.unsplash.com/photo-1603565816030-6b389eeb23cb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80'
    ]
  ),
  TravelPlaces(
    id: "3",
    name: "Machu Picchu",
    user:   users[2],
    statusTag: StatusTag.event,
    shared: 3200,
    likes: 2500,
    locationDesc: "Machu Picchu, Peru",
    desc:"Machu Picchu, a UNESCO World Heritage site and one of the New Seven Wonders of the World, is an awe-inspiring Incan citadel nestled high in the Andes mountains of Peru. Dating back to the 15th century, this ancient marvel remains a captivating mystery, with its purpose and history still sparking scholarly debate. The intricate stonework, terraced landscapes, and breathtaking panoramic views create a sense of wonder and admiration for the engineering and architectural prowess of the Inca civilization. Surrounded by lush greenery and shrouded in mist, Machu Picchu exudes an almost mystical ambiance, making it a must-visit destination for adventurers, history enthusiasts, and nature lovers alike.",
    imagesUrl: [
      'https://images.unsplash.com/photo-1568805746839-47f0dd6ad183?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
      "https://images.unsplash.com/photo-1580619305218-8423a7ef79b4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1748&q=80",
      "https://images.unsplash.com/photo-1568805746931-e5a89caecbc3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80"
    ],
      collection: [
        'https://images.unsplash.com/photo-1526697675318-89790adec369?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2835&q=80',
        'https://images.unsplash.com/photo-1631231248242-f82e0a0e2ea6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
        'https://images.unsplash.com/photo-1473455811944-fdd1b0f282f3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80',
        'https://images.unsplash.com/photo-1604689727774-6e8c049f3131?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=796&q=80',
        'https://images.unsplash.com/photo-1532996228489-082708ddbde0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=930&q=80'

      ]
  ),
  TravelPlaces(
    id: "4",
    name: "New York City",
    user:  users[3],
    statusTag: StatusTag.popular,
    shared: 4000,
    likes: 3200,
    locationDesc: "New York City, USA",
    desc:"New York City, often referred to as the Big Apple, is a vibrant and bustling metropolis located in the northeastern United States. As one of the world's most iconic cities, it epitomizes diversity, energy, and innovation. With its iconic skyline dominated by skyscrapers like the Empire State Building and One World Trade Center, the city offers a mix of historic landmarks, world-class museums, and contemporary art galleries. Times Square, Broadway theaters, and Central Park are just a few of the many famous attractions that draw millions of visitors each year. As a melting pot of cultures, New York City embraces a rich culinary scene, showcasing cuisines from all corners of the globe. Whether exploring its neighborhoods, shopping on Fifth Avenue, or taking in the city lights from the top of Rockefeller Center, New York City offers an unforgettable experience that captures the essence of urban excitement and opportunity.",
    imagesUrl: [
      "https://plus.unsplash.com/premium_photo-1680902988910-e04dc05c21ce?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=832&q=80",
      "https://images.unsplash.com/photo-1518391846015-55a9cc003b25?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80",
      "https://images.unsplash.com/photo-1541336032412-2048a678540d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80"
    ],
      collection: [
        'https://images.unsplash.com/photo-1545328805-926d6a0950ca?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80',
        'https://images.unsplash.com/photo-1572925192237-6ff8e0599888?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=930&q=80',
        'https://images.unsplash.com/photo-1572787514629-72872e4fc123?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80',
        'https://images.unsplash.com/photo-1602492640785-2e1709343804?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80',
            'https://images.unsplash.com/photo-1556146385-97d8a0b5e66b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=778&q=80',
      ]
  ),
  TravelPlaces(
      id: "5",
      name: "Kyoto",
      user:   users[4],
      statusTag: StatusTag.event,
      shared: 2300,
      likes: 1200,
      locationDesc: "Kyoto, Japan",
      desc:"Kyoto, a city steeped in history and tradition, is a captivating blend of ancient and modern Japan. Nestled in the Kansai region, this former imperial capital is renowned for its countless temples, shrines, and gardens that reflect its cultural heritage. Visitors can immerse themselves in the tranquility of bamboo forests, experience the elegance of traditional tea ceremonies, and witness the breathtaking beauty of cherry blossoms in the spring. While embracing its past, Kyoto also thrives as a dynamic city with modern architecture, vibrant markets, and a flourishing culinary scene. Whether strolling through historic streets or admiring the majestic Kyoto Imperial Palace, this cultural treasure offers a timeless charm that leaves a lasting impression on all who visit."
      ,
      imagesUrl: [
        "https://images.unsplash.com/photo-1624253321171-1be53e12f5f4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80",
        "https://images.unsplash.com/photo-1602764363500-e8e8455de955?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1932&q=80",
        "https://images.unsplash.com/photo-1558870832-c8db4b5b47d1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=688&q=80",
      ],
      collection:[
        'https://images.unsplash.com/photo-1601823984263-b87b59798b70?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80',
        'https://images.unsplash.com/photo-1524413840807-0c3cb6fa808d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80',
        'https://plus.unsplash.com/premium_photo-1666700698920-d2d2bba589f8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2064&q=80',
        'https://images.unsplash.com/photo-1526481280693-3bfa7568e0f3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1742&q=80',
        'https://images.unsplash.com/photo-1492571350019-22de08371fd3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1506&q=80'
      ]
  ),

];
