package kopo.poly.service.impl;

import com.google.api.client.googleapis.json.GoogleJsonResponseException;
import com.google.api.client.http.HttpRequest;
import com.google.api.client.http.HttpRequestInitializer;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.services.youtube.YouTube;
import com.google.api.services.youtube.model.Thumbnail;
import com.google.api.services.youtube.model.Video;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import org.springframework.stereotype.Service;
import kopo.poly.dto.YouTubeDTO;
import kopo.poly.service.IYoutubeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Slf4j
@Service("YoutubeService")
public class YoutubeService implements IYoutubeService {

    private static final HttpTransport HTTP_TRANSPORT = new NetHttpTransport();
    private static final JsonFactory JSON_FACTORY = new JacksonFactory();
    private static final long NUMBER_OF_VIDEOS_RETURNED = 1;
    private static YouTube youtube;

    private static void prettyPrint(Iterator<Video> iteratorSearchResults, YouTubeDTO youTubeDTO) {

        while (iteratorSearchResults.hasNext()) {

            Video singleVideo = iteratorSearchResults.next();
            // Double checks the kind is video.
            if (singleVideo.getKind().equals("youtube#video")) {
                Thumbnail thumbnail = (Thumbnail) singleVideo.getSnippet().getThumbnails().get("default");

                youTubeDTO.setThumbnailPath(thumbnail.getUrl());
                youTubeDTO.setTitle(singleVideo.getSnippet().getTitle());
                youTubeDTO.setVideoId(singleVideo.getId());

            }
        }
    }

    @Override
    public YouTubeDTO get() {
        YouTubeDTO youTubeDTO = new YouTubeDTO();

        try {
            youtube = new YouTube.Builder(HTTP_TRANSPORT, JSON_FACTORY, new HttpRequestInitializer() {
                public void initialize(HttpRequest request) throws IOException {
                }
            }).setApplicationName("youtube-video-duration-get").build();

            //내가 원하는 정보 지정할 수 있어요. 공식 API문서를 참고해주세요.
            YouTube.Videos.List videos = youtube.videos().list("id,snippet,contentDetails");
            videos.setKey("AIzaSyA2yyodQo9ZZVjU0y6muzLKhGa3G7WqTwg"); //API키
            videos.setId("CPXmqfu-9vs"); //동영상 ID
            videos.setMaxResults(NUMBER_OF_VIDEOS_RETURNED); //조회 최대 갯수.
            List<Video> videoList = videos.execute().getItems();

            if (videoList != null) {
                prettyPrint(videoList.iterator(), youTubeDTO);
            }

        } catch (GoogleJsonResponseException e) {
//            System.err.println("There was a service error: " + e.getDetails().getCode() + " : " + e.getDetails().getMessage());
            log.info(this.getClass().getName() + " error : " + e.getDetails().getCode() + " : " + e.getDetails().getMessage());
        } catch (IOException e) {
            log.info(this.getClass().getName() + " : There was an IO error: " + e.getCause() + " : " + e.getMessage());
        } catch (Throwable t) {
            t.printStackTrace();
        }

        return youTubeDTO;
    }

}
