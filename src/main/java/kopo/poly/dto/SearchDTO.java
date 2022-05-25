package kopo.poly.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

@JsonInclude(JsonInclude.Include.NON_DEFAULT)
@Data
public class SearchDTO {
    public String thumbnail;
    public String title;
    public String CHName;
}
