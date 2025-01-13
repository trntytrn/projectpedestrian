# **Project Pedestrian**
**Senior Capstone Project**  
**Partnered Project | October 2024**  

## **Overview**
**Project Pedestrian** is a senior capstone project aimed at enhancing pedestrian safety at busy intersections using innovative technology. This project integrates a **Bluetooth sensor** and an **iOS app** to notify pedestrians of high traffic density in real time. By distinguishing between vehicles and pedestrians using Bluetooth signal velocity, the system provides actionable safety insights for pedestrians.

This repository contains the **iOS app portion** of the project.

## **Key Features**
- **Traffic Density Map**:  
   Displays real-time traffic population density at intersections using a map interface.  
- **Bluetooth Signal Analysis**:  
   Differentiates between pedestrians and vehicles based on signal velocity.  
- **Notification System (In Progress)**:  
   Alerts users when they approach crowded intersections for safer crossing.  

## **How It Works**
1. **Bluetooth Sensors**:  
   Sensors installed at 4-way intersections detect Bluetooth signals and calculate the velocity of objects transmitting the signals to classify them as vehicles or pedestrians.  
2. **Traffic Population Map**:  
   The app visualizes this data using a map interface, providing pedestrians with a real-time view of traffic density.  
3. **Notifications** *(Under Development)*:  
   Pedestrians receive alerts when approaching crowded crosswalks to make informed decisions.  

## **Technologies Used**
- **Programming Language**: Swift  
- **Frameworks and APIs**:  
  - MapKit API for traffic visualization  
  - Local Notifications for user alerts *(in progress)*  
- **Hardware Integration**: Bluetooth sensors for velocity analysis

## **Known Issues & Future Work**
**Notification System:**
Partially implemented; additional testing and development are needed for full functionality.
**Real-Time Data Integration:**
Currently uses simulated data. Future work could involve integrating real-time data from municipal traffic systems.
**Scalability:**
Expanding coverage to multiple intersections and cities is a potential direction.
Contributors
- Trinity Tran
- Amanda Hopkins

