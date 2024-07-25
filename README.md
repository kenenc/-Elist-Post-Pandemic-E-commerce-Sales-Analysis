# "Elist" Post-Pandemic E-commerce Sales Analysis

# Background
Founded in 2018, Elist is an e-commerce company that specializes in selling electronic consumer goods to customers all across the country, with a recent user base expansion to global markets over the past few years. Like many other e-commerce companies, Elist sells their products through their online website as well as their own mobile app. Additionally, they utilize several different marketing channels to target consumers such as SEO, email campaigns, and affiliate links.

With over 100,000 records of order and customer data available from the years 2019-2022, there is a large opportunity to leverage analytics in order to uncover hidden trends and insights that may serve to prove essential for Elist and its marketing team.

The following graphic shows the Entity Relationship Diagram (ERD) which highlights the structure of the data tables and how they are used/joined for our analysis:

<img width="600" src="https://github.com/user-attachments/assets/08c99702-0b27-4522-a564-f2dc8041efd8">

# High-Level Summary
Starting from 2019, Elist’s most relevant metrics saw a steady trend upwards throughout the entire year. In 2020, there was a large and dramatic increase in every metric, namely due to the pandemic and its associated increase in consumer spending: 

- **Total sales** saw a 162% increase in 2020 from 2019
- **Average Order Value (AOV)** saw a 30% increase in 2020 from 2019
- **Total orders** saw a 100% increase in 2020 from 2019

After total sales peaked towards the end of 2020, there has since been a slow decline in most of these metrics all throughout 2021:

- **Total sales** saw a -10% decrease in 2021 from 2020
- **AOV** saw a -15% decrease in 2021 from 2020
- **Total orders** saw a 6% increase in 2021 from 2020

Continuing into 2022, this year showed the most notable decline across all metrics:

- **Total sales** saw a -46% decrease in 2022 from 2021
- **AOV** saw a -10% decrease in 2022 from 2021
- **Total orders** saw a -40% decrease in 2022 from 2021

As it stands, these metrics are back down at levels comparable to 2019, with total orders and total sales still up slightly (up ~28% for both in 2022 compared to 2019) and AOV being exactly the same as pre-pandemic levels ($230).

To better illustrate these trends, the following total sales chart paints a great picture of the above information:
<img width="805" alt="total sales" src="https://github.com/user-attachments/assets/caf5ca04-15b7-4657-969a-34614cb83568">

Additionally, the following pivot table displays all of the same information highlighted above but with additional filters for loyalty member status, individual products, and regions:
<img width="781" alt="Yearly Sales Table" src="https://github.com/user-attachments/assets/4dceedda-1919-44f3-ae68-6cdce44513e0">

# Insights Deep-Dive
## Seasonality
Analyzing how north star metrics (in this case, sales) trend by month/seasons can reveal a lot about customer purchasing behavior throughout the year. To analyze this seasonality, I created a month-over-month sales growth table along with a chart that shows the total sales broken up by year.

<img width="313" alt="MoM Sales Growth" src="https://github.com/user-attachments/assets/bc293f1f-11a6-4efa-9b8f-9a030beadf61"> <img width="596" alt="monthly sales trend by year" src="https://github.com/user-attachments/assets/ccb61216-fe3d-4ba2-bad6-b92ab0f1bdde">

By examining these charts, we can note a few observations: 

1. **January and (especially) February** tend to be **lower performing months** with sharp sales decline from the previous holiday months

2. March tends be a “rebound” month, where growth rates pick back up moderately from the Jan-Feb lows

3. Growth rates remain relatively stagnant throughout the next few months, where they then pick back up in the later summer months — most notably through July, August, and especially September

4. Excluding 2022, September typically sees the 2nd highest peak in total sales for a given year

5. Following September, **October is notoriously a poor performing month** with some of the sharpest decline in sales growth rates besides Jan-Feb

6. Finally, **November and (especially) December are the strongest performing months**, with sharp increases in sales growth due to higher consumer spending associated with the holiday season

## Regionality
Next, I analyzed how Elist’s sales differed across customer region. In the following chart, you can see the percentage of total sales that each region constituted at any given time from 2019-2022.

<img width="809" alt="total sales per region" src="https://github.com/user-attachments/assets/9af1cff8-38f0-4584-b016-256e8f23fad9">

- **North American (NA)** orders accounted for the majority of all sales by far:
    - ~$14.5M total sales & ~51.7% of all sales
- **Europe, the Middle East and Africa (EMEA)** were the next largest contributor to sales:
    - ~$8.2M total sales & ~29.2% of all sales
- Next, the **Asia–Pacific (APAC)** region followed in third place:
    - ~$3.6M total sales & ~13% of all sales
- Lastly, **Latin America (LATAM)** had the smallest impact on sales of all regions:
    - ~$1.6M total sales & ~6% of all sales

Besides the discrepancies among these regions, there does not appear to be any other trends or specific patterns to note with regards to each region’s purchasing behavior; most of the fluctuations in sales proportion are either sporadic or uniform with the other regions.

## Product Performance
<img width="245" alt="products" align="left" src="https://github.com/user-attachments/assets/4d21c2cb-ac84-41b6-827b-63c745261457">   Examining which products perform/sell the best are among one of the most important factors to analyze for an e-commerce company. The following pivot table shows the total sales and number of orders for every product in each year.

  The **products that earned the highest sales** were the **27in 4k Gaming Monitor** (\~$9.8M total sales) followed by **Apple Airpods Headphones** (~$7.7M total sales). The Macbook Air Laptop came in third with ~$6.2M in total sales, followed by the Thinkpad Laptop with ~$3.2M in total sales. The rest of the products only made up a small proportion of sales relative to the top four items mentioned.    

  As for orders placed, the **number one highest ordered item** was by far the **Apple Airpods Headphones** with 48,404 total orders. Next came the 27in 4K Gaming Monitor with 23,408 orders and the Samsung Charging Cable Pack in close third with 21,923 orders. Again, the rest of the items made up only a small relative proportion of orders compared the top three, which accounted for the vast majority of all orders. 

<br clear="left"/>

## Refunds
<img width="400" alt="refunds" align="left" src="https://github.com/user-attachments/assets/a423587c-d096-489f-b3f1-155a684e87e1"> Refunds are yet another important variable to analyze with regards to product satisfaction. The pivot table shown here displays a list of all products sold by Elist and their given AOV, number of refunds, and refund rate (# of refunds / # of total orders) for each year. 

The **item with the most number of refunds** by far are the **Apple Airpods Headphones** (2636 total refunds) followed by the 27in 4k Gaming Monitor (1444 total refunds). 

With respect to percentages, **the most proportionately refunded items (highest refund rates)** are the two laptops sold by Elist: the **Macbook Air** and **Thinkpad Laptop**. The Apple iPhone and 27in 4K Gaming Monitor are the next most commonly refunded items yet are still not as high as the laptops.

Another interesting thing to note is that the products with the highest refund rates are also the ones with the highest AOV, and vice versa. This makes sense on a more psychological level as customers may feel less incentivized to go through the refund process on an item that costs relatively less than others.

<br clear="left"/>

## Loyalty Program
Lastly, another important area of interest to examine are the differences between loyalty and non-loyalty members who use the platform. To do this, another pivot table was created which compares the three main metrics from earlier (total sales, AOV, total orders) and how they differ between the two groups:

&nbsp;

<img width="817" alt="loyalty table" src="https://github.com/user-attachments/assets/a0e4949a-15c0-47b0-ae18-738fc1946575">

&nbsp;

Here we notice something in particular: **during the first two years, loyalty members do not outperform non-loyalty members in terms of sales, AOV, or orders placed. During the last two years, however, this trend shifts and reverses:** 2021 is the first year where sales and orders placed are actually higher for loyalty members than non-members. In 2022, all metrics (now including AOV) are higher for loyalty members than non-members. This shift is significant, and definitely something to make note of.

# Recommendations
Taking all of our above analysis into consideration, there are a few recommendations that we can offer from our findings:

- **Increase Overall Marketing Efforts:** Discuss with the marketing team to see if there are any sort of campaigns that can be run in order to get more eyes on Elist and regain some of the lost sales/revenue since the peak of the pandemic.

- **Improve Poor Performing Months:** See if there are any ways to increase purchases and sales during the historically poor performing months (January, February, and October), perhaps by offering special discounts or incentives during these time periods.

- **Lean Into North American and EMEA Consumers:** Since NA and EMEA regions account for the considerable majority of all sales, it may be fruitful to continue catering/marketing to these audiences to further increase northstar metrics among these groups. Alternatively, if there is desire to expand into more of the untapped markets, marketing efforts could be directed to the underrepresented regions such as Latin America and the Asia-Pacific.

- **Consider the Opportunity Costs for Keeping Poor Performing Products:** Investigate the reason for the very low amount of Bose Soundsport Headphone sales/orders and consider the pros and cons of continuing to offer the poorer performing products.

- **Investigate the Abnormally High Refund Rates for Laptops:** Figure out if there are any specific reasons as to why customers refund both the Macbook Air and Thinkpad Laptops at considerably higher rates than all other products.

- **Continue to Promote and Advance the Loyalty Program System:** During the last two years of operation, loyalty program members have started to outpace non-loyalty members in terms of sales, AOV, and orders placed. Continuing to incentivize customers through this program seems to be working in Elist’s favor and may continue to prove profitable in the future.





