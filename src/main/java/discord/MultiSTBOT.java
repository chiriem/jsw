//package discord;
//
//import net.dv8tion.jda.api.JDA;
//import net.dv8tion.jda.api.JDABuilder;
//import net.dv8tion.jda.api.events.message.MessageReceivedEvent;
//import net.dv8tion.jda.api.hooks.ListenerAdapter;
//
//import javax.security.auth.login.LoginException;
//
//public class MultiSTBOT extends ListenerAdapter {
//    public static void main(String[] Args) throws LoginException {
//        JDA jda = JDABuilder.createDefault("OTc2MzUwOTAxNDQwNzQ5NTk5.G-CA5V.I0wKh5uhDO2RlPM89cPoAz_vTrMcZ7e6j9Osbw").build();
//
//        jda.addEventListener(new MultiSTBOT());
//    }
//
//    String ytch_add = "yt notify add youtube.com/c/1분요리뚝딱이형";
//
//    @Override
//    public void onMessageReceived(MessageReceivedEvent event) {
//        if(event.getMessage().getContentRaw().equals("!ping")){
//            event.getChannel().sendMessage("pong!").queue();
//        }
//        if(event.getMessage().getContentRaw().equals("뚝딱추가")){
//            event.getChannel().sendMessage(ytch_add).queue();
//        }
//    }
//}
