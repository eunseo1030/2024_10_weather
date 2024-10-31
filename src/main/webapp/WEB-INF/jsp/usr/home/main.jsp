<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
    const API_KEY = '35b306f8d64ba96e7744c934c94aaade'; // 여기에 실제 API 키를 넣어주세요
</script>


<hr />

<div style="display: flex; justify-content: center; align-items: center; height: 70vh; flex-direction: column;">
    <h2>날씨 검색</h2>
    <input 
        id="locationInput" 
        type="text" 
        placeholder="도시 이름을 입력하세요" 
        onkeydown="if(event.key === 'Enter') searchWeather()" 
        style="padding: 10px; border-radius: 5px; border: 1px solid #ccc; margin-bottom: 20px; width: 80%; max-width: 300px;"
    />
    <div id="weatherResult" style="display: none; border: 1px solid #ddd; padding: 20px; border-radius: 8px; background-color: #f9f9f9; width: 80%; max-width: 300px; text-align: left;"></div>
</div>

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>
    function searchWeather() {
        const location = document.getElementById("locationInput").value.trim();
        
        // 도시 이름이 비어있는지 확인
        if (!location) {
            alert("도시 이름을 입력해주세요.");
            return;
        }

        const url = `https://api.openweathermap.org/data/2.5/weather?q=\${location}&appid=\${API_KEY}&units=metric&lang=kr`;

        $.ajax({
            url: url,
            type: "GET",
            dataType: "json",
            success: function(data) {
                console.log(data); // 데이터 구조 확인용 로그
                const weatherResult = document.getElementById("weatherResult");
                weatherResult.style.display = "block";
                weatherResult.innerHTML = `
                    <p><strong>도시:</strong> \${data.name}</p>
                    <p><strong>온도:</strong> \${data.main.temp}°C</p>
                    <p><strong>습도:</strong> \${data.main.humidity}%</p>
                    <p><strong>풍속:</strong> \${data.wind.speed}m/s</p>
                    <p><strong>기상:</strong> \${data.weather[0].main}</p>
                `;
            },
            error: function(error) {
                console.error("Error fetching weather data:", error);
                alert("날씨 데이터를 불러오는 중 오류가 발생했습니다. API 키 또는 도시 이름을 확인해주세요.");
            }
        });
    }
</script>

<div id="weather-container" style="text-align: center; padding: 20px;"></div>

<style>
    .weather-info {
        font-family: Arial, sans-serif;
        background-color: #f9f9f9;
        border: 1px solid #ddd;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        margin: 10px;
        display: inline-block;
        width: 200px;
    }
    .weather-info h3 {
        margin-bottom: 10px;
        font-size: 1.2em;
    }
    .weather-info p {
        margin: 5px 0;
    }
</style>
