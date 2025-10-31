import requests
import locale


class ArcaplMonitor:
    url = None
    def __init__(self, url: str):
        self.debug = 0
        self.url = url
        self.data = None
        self._fetch_data()
        locale.setlocale(locale.LC_ALL, 'en_US.UTF-8')
        
    def _fetch_data(self):
        """Fetch JSON data from the given URL."""
        try:
            response = requests.get(self.url)
            response.raise_for_status()
            json_data = response.json()

            # Expecting a list of objects; take the first one
            if isinstance(json_data, list) and len(json_data) > 0:
                self.data = json_data[0]
                if self.debug > 2:
                    print (self.data)
            else:
                raise ValueError("Unexpected JSON format: expected a non-empty list")

        except requests.RequestException as e:
            print(f"Error fetching data: {e}")
        except ValueError as e:
            print(f"Invalid JSON data: {e}")

    def setDebugLvl(self, level):
        self.debug = level
        
    # --- Getter methods ---
    def getStatus(self):
        self._fetch_data()
        status = self.data.get("status") if self.data else None
        if self.debug > 0:
            print("Status: ", status)
        if status == "Working":
            return 1
        if status == None:
            return 0
        else:
            return 2
        return self.data.get("status") if self.data else None

    def getPvCount(self):
        return int(self.data.get("pvCount")) if self.data else None

    def getConnectedPVCount(self):
        return int(self.data.get("connectedPVCount")) if self.data else None

    def getDisconnectedPVCount(self):
        return int(self.data.get("disconnectedPVCount")) if self.data else None

    def getEventRate(self):
        return locale.atof(self.data.get("eventRate")) if self.data else None

    def getDataRate(self):
        return locale.atof(self.data.get("dataRate")) if self.data else None

    def getDataRateGBPerDay(self):
        return self.data.get("dataRateGBPerDay") if self.data else None

    def getDataRateGBPerYear(self):
        return self.data.get("dataRateGBPerYear") if self.data else None

    def getInstance(self):
        return self.data.get("instance") if self.data else None

    def getCapacityUtilized(self):
        return self.data.get("capacityUtilized") if self.data else None

    def getTotalETLRuns0(self):
        return int(self.data.get("totalETLRuns(0)")) if self.data else None

    def getTotalETLRuns1(self):
        return int(self.data.get("totalETLRuns(1)")) if self.data else None

    def getTimeForOverallETLInSeconds0(self):
        return int(self.data.get("timeForOverallETLInSeconds(0)")) if self.data else None

    def getTimeForOverallETLInSeconds1(self):
        return int(self.data.get("timeForOverallETLInSeconds(1)")) if self.data else None

    def getFormattedWriteThreadSeconds(self):
        return locale.atof(self.data.get("formattedWriteThreadSeconds")) if self.data else None

    def getSecondsConsumedByWriter(self):
        data = self.data.get("secondsConsumedByWriter")
        if data == None:            
            # Note: JSON key is "secondsConsumedByWritter" (typo preserved) in old versions of AA
            data = self.data.get("secondsConsumedByWritter")
        return locale.atof(data) if data else None

    def getMaxETLPercentage(self):
        return locale.atof(self.data.get("maxETLPercentage")) if self.data else None

    def getAvgTimeETL0(self):
        if self.data:
            return float(self.getTimeForOverallETLInSeconds0() / self.getTotalETLRuns0())
        else:
            return None

    def getAvgTimeETL1(self):
        if self.data:
            return float(self.getTimeForOverallETLInSeconds1() / self.getTotalETLRuns1())
        else:
            return None
        
# Example usage:
# aa = ArcaplMonitor("https://example.com/data.json")
# print(aa.getStatus())
# print(aa.getPvCount())
