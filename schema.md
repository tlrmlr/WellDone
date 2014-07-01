User
  name
  phone_num
  email
  pass
  
Pump
  location
  current_status (status type)
  last_update_time
  *notes
  
Report
  pump (foreign)
  timestamp
  photos (list)
  text
  user (foreign)
  status (status type)
  
State Type (an enum):
  GOOD
  FIX_IN_PROGRESS
  BROKEN_TEMPORARY
  BROKEN_PERMANENT
  REQUIRES_ATTENTION
  
SensorData
  pump (foreign)
  timestamp
  volume (float)
  temperature (float)
  pressure (float)

  
  
