// users message list
List userMessages = [
  {
    "id": 1,
    "name": "Michael Dam",
    "img":
        "https://images.unsplash.com/photo-1571741140674-8949ca7df2a7?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "online": true,
    "story": true,
    "Like": "153",
    "Comment": "20",
    "message": "How are you doing?",
    "created_at": "1:00 pm",
    "status": "online"
  },
  {
    "id": 2,
    "name": "Charly Race",
    "img":
        "https://images.unsplash.com/photo-1467272046618-f2d1703715b1?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "online": false,
    "story": false,
    "Like": "16k",
    "Comment": "10k",
    "message": "Long time no see!!",
    "created_at": "12:00 am",
    "status": "online"
  },
  {
    "id": 3,
    "name": "Tyler Nix",
    "img":
        "https://images.unsplash.com/photo-1517070208541-6ddc4d3efbcb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3319&q=80",
    "online": false,
    "story": true,
    "Like": "3k",
    "Comment": "751",
    "message": "Glad to know you in person!",
    "created_at": "3:30 pm",
    "status": "online"
  },
  {
    "id": 4,
    "name": "Kirill Bishop",
    "img":
        "https://images.unsplash.com/photo-1536763843054-126cc2d9d3b0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
    "online": false,
    "story": false,
    "Like": "985",
    "Comment": "200",
    "message": "I'm doing fine and how about you?",
    "created_at": "9:00 am",
    "status": "online"
  },
  {
    "id": 5,
    "name": "Lesly Liverani",
    "img":
        "https://images.unsplash.com/photo-1521572267360-ee0c2909d518?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80",
    "online": true,
    "story": false,
    "Like": "2",
    "Comment": "0",
    "message": "What is your real name?",
    "created_at": "11:25 am",
    "status": "Away"
  },
  {
    "id": 6,
    "name": "Valerie Deluvio",
    "img":
        "https://images.unsplash.com/photo-1523264939339-c89f9dadde2e?ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80",
    "online": true,
    "Like": "663",
    "Comment": "782",
    "story": true,
    "message": "I'm happy to be your friend",
    "created_at": "10:00 am",
    "status": "Away"
  },
  {
    "id": 7,
    "name": "Frank Henry",
    "img":
        "https://images.unsplash.com/photo-1458696352784-ffe1f47c2edc?ixlib=rb-1.2.1&auto=format&fit=crop&w=1951&q=80",
    "online": false,
    "story": false,
    "Like": "15k",
    "Comment": "230",
    "message": "Thanks for your help.",
    "created_at": "2:34 pm",
    "status": "Away"
  },
  {
    "id": 8,
    "name": "Joanna Lackmann",
    "img":
        "https://images.unsplash.com/photo-1519531591569-b84b8174b508?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "online": false,
    "Like": "142",
    "Comment": "1k",
    "story": true,
    "message": "I just arrived home.",
    "created_at": "1:12 am",
    "status": "online"
  },
];
// list of messages
List messages = [
  {
    "isMe": true,
    "messageType": 1,
    "message": "Ubuntu jng hery",
    "profileImg":
        "https://images.unsplash.com/photo-1517070208541-6ddc4d3efbcb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3319&q=80"
  },
  {
    "isMe": true,
    "messageType": 2,
    "message": "Need to use code to command",
    "profileImg":
        "https://images.unsplash.com/photo-1517070208541-6ddc4d3efbcb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3319&q=80"
  },
  {
    "isMe": true,
    "messageType": 3,
    "message": "Tov work tor hery",
    "profileImg":
        "https://images.unsplash.com/photo-1517070208541-6ddc4d3efbcb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3319&q=80"
  },
  {
    "isMe": false,
    "messageType": 1,
    "message": "me hate you",
    "profileImg":
        "https://images.unsplash.com/photo-1517070208541-6ddc4d3efbcb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3319&q=80"
  },
  {
    "isMe": false,
    "messageType": 2,
    "message": "bah",
    "profileImg":
        "https://images.unsplash.com/photo-1517070208541-6ddc4d3efbcb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3319&q=80"
  },
  {
    "isMe": false,
    "messageType": 3,
    "message": "-_-",
    "profileImg":
        "https://images.unsplash.com/photo-1517070208541-6ddc4d3efbcb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3319&q=80"
  },
  {
    "isMe": true,
    "messageType": 1,
    "message": "Som muk",
    "profileImg":
        "https://images.unsplash.com/photo-1517070208541-6ddc4d3efbcb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3319&q=80"
  },
  {
    "isMe": true,
    "messageType": 3,
    "message": "Ory Reang",
    "profileImg":
        "https://images.unsplash.com/photo-1517070208541-6ddc4d3efbcb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3319&q=80"
  },
  {
    "isMe": false,
    "messageType": 1,
    "message": "Eng use ah laptop nus ubuntu",
    "profileImg":
        "https://images.unsplash.com/photo-1517070208541-6ddc4d3efbcb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3319&q=80"
  },
  {
    "isMe": false,
    "messageType": 2,
    "message": "code teat ban jenh",
    "profileImg":
        "https://images.unsplash.com/photo-1517070208541-6ddc4d3efbcb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3319&q=80"
  },
  {
    "isMe": false,
    "messageType": 3,
    "message": "use laptop neng lerk na kor code",
    "profileImg":
        "https://images.unsplash.com/photo-1517070208541-6ddc4d3efbcb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3319&q=80"
  },
  {
    "isMe": true,
    "messageType": 4,
    "message": "Oh hahahah good",
    "profileImg":
        "https://images.unsplash.com/photo-1517070208541-6ddc4d3efbcb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3319&q=80"
  },
  {
    "isMe": false,
    "messageType": 4,
    "message":
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
    "profileImg":
        "https://images.unsplash.com/photo-1517070208541-6ddc4d3efbcb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3319&q=80"
  }
];
