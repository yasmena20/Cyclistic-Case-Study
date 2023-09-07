# Cyclistic-Case-Study

## Links
Certificate: [Google Data Analyitics](https://www.coursera.org/account/accomplishments/professional-cert/WLR7P5RF93BW?utm_source=ln&utm_medium=certificate&utm_content=cert_image&utm_campaign=sharing_cta&utm_product=prof)   
Data visualisation: [Tableau](https://public.tableau.com/views/TypesofBikes/Sheet1?:language=en-US&:display_count=n&:origin=viz_share_link)

## Introduction
Cyclistic is a bike-share program that features more than 5,800 bicycles and 600 docking stations. Cyclistic sets itself apart by also offering reclining bikes, hand tricycles, and cargo bikes, making bike-share more inclusive to people with disabilities and riders who can’t use a standard two-wheeled bike. The majority of riders opt for traditional bikes; about 8% of riders use the assistive options. Cyclistic users are more likely to ride for leisure, but about 30% use them to commute to work each day.


## Ask
**Business Task :** Analyze how annual members and casual riders use Cyclistic bikes differently in order to put a strategy to maximise the number of annual memberships by converting casual riders into annual riders.


## Prepare
**Data Source :** The previous 12 months of Cyclistic’s historical trip data from 8/2022 to 7/2023 [Here](https://divvy-tripdata.s3.amazonaws.com/index.html) .The data has been made available by Motivate International Inc.
The data-privacy issues prohibit from using riders’ personally identifiable information, and will not be able to connect pass purchases to credit card numbers to determine if casual riders live in the Cyclistic service area or if they have purchased multiple single passes.
## Process
**Tools i used for data exploration and cleaning:**
- BigQuery

**Reason :** Cyclistic data has more than 5 million rows and Excel limitation is 1,048,576 rows. So BigQuery is used to handle large data.

          
### Data exploration and cleaning:

1. Check table columns and their data type.

<img width="550" alt="Screen Shot 2023-08-24 at 6 14 34 PM" src="https://github.com/yasmena20/Cyclistic-Case-Study/assets/24322947/1d15b8ea-a06d-48cf-bb72-cbaf4c168fa9">  <br /> 


2. Count the number of null values for each column in the combined table.
   
<img width="1123" alt="Screen Shot 2023-08-24 at 7 45 45 PM" src="https://github.com/yasmena20/Cyclistic-Case-Study/assets/24322947/545803bc-1a99-40bc-b6b4-7f9ef7efd57b"> <br /> 


3. ride_id has no duplicates or null values and all the rows have the same length of 16 digits. so we can consider it as the primary key. <br /> 

4. There are 3 unique types of bikes and electric_bike is the most used type.
   <img width="397" alt="Screen Shot 2023-08-24 at 8 51 55 PM" src="https://github.com/yasmena20/Cyclistic-Case-Study/assets/24322947/a5660fe2-084f-4ed8-b02a-abed667b1520">

5. There are 264637 trips with durations of less than a minute and 5292 trips with duration longer than a day that should be removed.

6. Create columns “ride_length”, “day_of_week” and “month” to help in analysis. 

7. Remove all the null cells from the data and now we are ready to use it for analysis.



## Analysis and Share


**.Tableau** is used for data visualisation.

First I looked at the types of bikes preferred by our members and casual riders, along with the number of rides each type of bike made.

<img width="850" alt="types_of_bikes" src="https://github.com/yasmena20/Cyclistic-Case-Study/assets/24322947/7a55edb1-4003-4bc8-aee2-b3eea8db0494">

As we can see, the classic bike is the most used bike by both members and casual riders and members made around 62.5% of the total trips made in these 12 months while casual riders made 37.5% of rides.<br />


Next trips made by members and casual riders per month, day and hour.
<img width="850" alt="Trips per month" src="https://github.com/yasmena20/Cyclistic-Case-Study/assets/24322947/88bda392-86f2-49bc-b2b7-c07e41d93964">
According to the graph, the highest number of trips by both members and casual riders occurred during the summer, particularly in August, with a noticeable decline during the winter months.<br/><br/>


<img width="850" alt="Trips per day" src="https://github.com/yasmena20/Cyclistic-Case-Study/assets/24322947/84305794-42fb-4df9-82f2-bf69cc11995a">

Looking at the days of the week, casual riders had a higher trip count during the weekends, whereas members displayed a decline during the weekend compared to the rest of the week.<br/><br/>

<img width="850" alt="Trips per hour" src="https://github.com/yasmena20/Cyclistic-Case-Study/assets/24322947/a09530e6-aded-4fbe-8504-41e1a4de5444">

When considering the hour of the day, members exhibit two peaks in terms of the number of trips. One occurs early in the morning, around 6 am to 8 am, and the other in the evening, around 4 pm to 6 pm. In contrast, the number of trips for casual riders consistently increases throughout the day until the evening, after which it starts to decrease.
That means members use bikes for work but casual riders for leisure.

Examine the ride durations of trips to identify differences in the behaviour of casual and member riders.
<img width="850" alt="Avg ride duration per month" src="https://github.com/yasmena20/Cyclistic-Case-Study/assets/24322947/ac4de20d-778c-4fab-ab56-70dd9e3ba98c">
<img width="850" alt="Avg ride duration per day" src="https://github.com/yasmena20/Cyclistic-Case-Study/assets/24322947/c268c94d-ea08-437c-bb9e-e25e1203cc98">
<img width="850" alt="Avg ride duration per hour" src="https://github.com/yasmena20/Cyclistic-Case-Study/assets/24322947/736cc65d-27c2-4fa6-a753-85cc5862f524">          
Casual riders tend to take longer trips than members. Members' trip lengths stay consistent throughout the year, week or day. In contrast, casual riders have longer rides during spring and summer, on weekends, and from 10 am to 2 pm. <br /> <br />      


To further understand the differences in casual and member riders, locations of starting and ending stations are analysed.
<img width="850" alt="Trips at Starting Stations" src="https://github.com/yasmena20/Cyclistic-Case-Study/assets/24322947/25f26908-cc42-48df-9cc8-65656e041af8">
<img width="850" alt="Trips at Ending Stations" src="https://github.com/yasmena20/Cyclistic-Case-Study/assets/24322947/c97dff27-02db-4a7d-92e0-ed3bc9538952">   
The maps show casual riders often started their trips from the stations near museums, parks, beach, harbor points and aquariums. On the other hand, members typically initiate their journeys from stations close to universities, residential areas, train stations, grocery stores, restaurants and parks.
Similar trends can be observed in ending station locations.<br />


### Summary:
- Casual riders tend to favour using bikes all day long, with a higher frequency on weekends during the summer and spring. On the other hand, members show a preference for riding bikes on weekdays during the commuting hours of 8 am to 5 pm, particularly in the summer and spring seasons.

- Casual riders travel longer distances, but not as often as members. They take longer rides likely for leisure.

- Casual riders start and end their trips near parks, beaches and recreational sites. While members near universities, train stations and residential areas.




## Act
After identifying the differences between casual and member riders, we can develop marketing strategies to encourage casual riders to become members. Here are our recommendations:

**- Targeted Seasons:** Launch marketing campaigns during spring and summer at popular places where casual riders often visit for leisure.

**- Weekend and Seasonal Options:** Recognize that casual riders are most active on weekends and during the summer, and consider offering seasonal or weekend-only memberships.

**- Ride Duration Incentives:** Note that casual riders tend to use their bikes for longer durations than members. Encourage them with discounts for longer rides, which may also entice members to ride for extended periods.

