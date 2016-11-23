import numpy as np

class Utilities:
    def normalizeNone(self,val):
        if np.isnan(val):
            return 0
        else:
            return val

    def normalize_data(self,dataFrame):
        for column in dataFrame:
            dataFrame[column] = dataFrame[column].fillna(self.normalizeNone(dataFrame[column].dropna().median()))
        return dataFrame

    def normalize_data_w_medians(self,dataFrame,medians):
        for column in dataFrame:
            dataFrame[column] = dataFrame[column].fillna(self.normalizeNone(medians[column].dropna().mean()))
        return dataFrame

    def findNa(self,data_frame,chunknum):    
        median_row={}
        for column in data_frame:    
            median_row[column] = self.normalizeNone(data_frame[column].dropna().median())
        return median_row

    def addNanDummies(self,data_frame):
        for column in data_frame:
            data_frame[column+"_isNan"]=data_frame[column].map(lambda x: 1 if np.isnan(x) else 0)
        return data_frame

    def convertToBinary(self,data_frame):
        for column in data_frame:
            if(column != 'Id'):
                data_frame[column]=data_frame[column].map(lambda x: 1 if np.isnan(x) else 0)
        return data_frame

    def dateColumnToNumerical(self,column_name):
        columnParts = column_name.split('_')
        lastPart = columnParts[2].split('D')
        columnParts[2] = 'F'+str(int(lastPart[1])-1)
        return '_'.join(columnParts)

    def numColumnToDate(self,column_name):
        columnParts = column_name.split('_')
        lastPart = columnParts[2].split('F')
        columnParts[2] = 'D'+str(int(lastPart[1])+1)
        return '_'.join(columnParts)