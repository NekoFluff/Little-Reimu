switch (mpos){
    case 0:
        room_selected = room_difficulty;
        alarm[0] = 2;
        break;
    case 1:
        //room_goto(room_options);
        //alarm[0] = 2;
        break;
    case 2:
        //alarm[0] = 2;
        //room_goto(room_music);
        break;
    case 3:
        //alarm[0] = 2;
        //room_goto(room_credits);
        break;
    case 4:
        game_end();
        break;
    default:
        break;
}
