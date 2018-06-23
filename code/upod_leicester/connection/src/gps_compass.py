#! /usr/bin/env python

import rospy 
from sensor_msgs.msg import NavSatFix
from std_msgs.msg import Float64
from cavlab_core.msg import LatLngHeadingFix

data = LatLngHeadingFix()
pub = rospy.Publisher('latlng', LatLngHeadingFix, queue_size = 10)

def onGps(gps_msg):
	data.latitude = gps_msg.latitude
	data.longitude = gps_msg.longitude
        data.header =  gps_msg.header
	rospy.loginfo("----reading gps data------")
	
	pub.publish(data)

def onCompass(compass_msg):
	data.heading = compass_msg.data
        rospy.loginfo("----reading compass data-----")

def connection():
        rospy.Subscriber('phone1/android/fix', NavSatFix, onGps)
	rospy.Subscriber('arduino_compass/compass', Float64, onCompass)       
	rospy.init_node('gps_compass')
	rospy.spin()

if __name__ == '__main__':
	connection()
	
	   
