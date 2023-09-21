package kr.co.hit.dto;

import java.util.LinkedList;
import java.util.Objects;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ChatingRoom {
	private String roomNumber;
	private String roomName;
	private LinkedList<String> users;
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ChatingRoom other = (ChatingRoom) obj;
		return Objects.equals(roomNumber, other.roomNumber);
	}
	@Override
	public int hashCode() {
		return Objects.hash(roomNumber);
	}
}
