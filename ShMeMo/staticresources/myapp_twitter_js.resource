var twitterFetcher = function () {
    function x(e) {
        return e.replace(/<b[^>]*>(.*?)<\/b>/gi, function (c, e) {
            return e
        }).replace(/class=".*?"|data-query-source=".*?"|dir=".*?"|rel=".*?"/gi, "")
    }

    function p(e, c) {
        for (var g = [], f = RegExp("(^| )" + c + "( |$)"), a = e.getElementsByTagName("*"), h = 0, d = a.length; h < d; h++) f.test(a[h].className) && g.push(a[h]);
        return g
    }
    var y = "",
        l = 20,
        s = !0,
        k = [],
        t = !1,
        q = !0,
        r = !0,
        u = null,
        v = !0,
        z = !0,
        w = null,
        A = !0;
    return {
        fetch: function (e, c, g, f, a, h, d, b, m, n) {
            void 0 === g && (g = 20);
            void 0 === f && (s = !0);
            void 0 === a && (a = !0);
            void 0 === h && (h = !0);
            void 0 === d && (d = "default");
            void 0 === b && (b = !0);
            void 0 === m && (m = null);
            void 0 === n && (n = !0);
            t ? k.push({
                id: e,
                domId: c,
                maxTweets: g,
                enableLinks: f,
                showUser: a,
                showTime: h,
                dateFunction: d,
                showRt: b,
                customCallback: m,
                showInteraction: n
            }) : (t = !0, y = c, l = g, s = f, r = a, q = h, z = b, u = d, w = m, A = n, c = document.createElement("script"), c.type = "text/javascript", c.src = "//cdn.syndication.twimg.com/widgets/timelines/" + e + "?&lang=en&callback=twitterFetcher.callback&suppress_response_codes=true&rnd=" + Math.random(), document.getElementsByTagName("head")[0].appendChild(c))
        },
        callback: function (e) {
            var c = document.createElement("div");
            c.innerHTML = e.body;
            "undefined" === typeof c.getElementsByClassName && (v = !1);
            e = [];
            var g = [],
                f = [],
                a = [],
                h = [],
                d = 0;
            if (v)
                for (c = c.getElementsByClassName("tweet"); d < c.length;) {
                         if(c.length)
                       $('#loaderImage').hide();
                     $('#overlay').hide();
                    0 < c[d].getElementsByClassName("retweet-credit").length ? a.push(!0) : a.push(!1);
                    if (!a[d] || a[d] && z) e.push(c[d].getElementsByClassName("e-entry-title")[0]), h.push(c[d].getAttribute("data-tweet-id")), g.push(c[d].getElementsByClassName("p-author")[0]), f.push(c[d].getElementsByClassName("dt-updated")[0]);
                    d++
                } else
                    for (c = p(c, "tweet"); d < c.length;) e.push(p(c[d], "e-entry-title")[0]), h.push(c[d].getAttribute("data-tweet-id")), g.push(p(c[d], "p-author")[0]), f.push(p(c[d], "dt-updated")[0]), 0 < p(c[d], "retweet-credit").length ? a.push(!0) : a.push(!1), d++;
            e.length > l && (e.splice(l, e.length - l), g.splice(l, g.length - l), f.splice(l, f.length - l), a.splice(l, a.length - l));
            c = [];
            d = e.length;
            for (a = 0; a < d;) {
                if ("string" !== typeof u) {
                    var b = new Date(f[a].getAttribute("datetime").replace(/-/g, "/").replace("T", " ").split("+")[0]),
                        b = u(b);
                    f[a].setAttribute("aria-label", b);
                    if (e[a].innerText)
                        if (v) f[a].innerText = b;
                        else {
                            var m = document.createElement("p"),
                                n = document.createTextNode(b);
                            m.appendChild(n);
                            m.setAttribute("aria-label", b);
                            f[a] = m
                        } else f[a].textContent = b
                }
                b = "";
                s ? (r && (b += '<div class="user">' + x(g[a].innerHTML) + "</div>"), b += '<p class="tweet" id="yu_11">' + x(e[a].innerHTML) + "</p>", q && (b += '<p class="timePosted">' + f[a].getAttribute("aria-label") + "</p>")) : e[a].innerText ? (r && (b += '<p class="user">' + g[a].innerText + "</p>"), b += '<p class="tweet" id="yu_13">' + e[a].innerText +
                    "</p>", q && (b += '<p class="timePosted">' + f[a].innerText + "</p>")) : (r && (b += '<p class="user">' + g[a].textContent + "</p>"), b += '<p class="tweet" id="yu_12">' + e[a].textContent + "</p>", q && (b += '<p class="timePosted">' + f[a].textContent + "</p>"));
                A && (b += '<p class="interact"><a href="https://twitter.com/intent/tweet?in_reply_to=' + h[a] + '" class="twitter_reply_icon">Reply</a><a href="https://twitter.com/intent/retweet?tweet_id=' + h[a] + '" class="twitter_retweet_icon">Retweet</a><a href="https://twitter.com/intent/favorite?tweet_id=' +
                    h[a] + '" class="twitter_fav_icon">Favorite</a></p>');
                c.push(b);
                a++
            }
            if (null == w) {
                e = c.length;
                g = 0;
                f = document.getElementById(y);
                for (h = "<ul>"; g < e;) h += "<li>" + c[g] + "</li>", g++;
                f.innerHTML = h + "</ul>"
            } else w(c);
            t = !1;
            0 < k.length && (twitterFetcher.fetch(k[0].id, k[0].domId, k[0].maxTweets, k[0].enableLinks, k[0].showUser, k[0].showTime, k[0].dateFunction, k[0].showRt, k[0].customCallback, k[0].showInteraction), k.splice(0, 1))
        }
    }
}();



function refresh(){
    $('#overlay').show();

    
$('#loaderImage').show();

twitterFetcher.fetch('490503628898062337', 'example1', 20, true, true, false, '', false, handleTweets, false);


};


function  resetform(){
    document.getElementById('amar_id').value = "";
    document.getElementById('akbar_id').value =  "";
    document.getElementById('anthony_id').value = "";
    document.getElementById('final_weightage').value = "";
    document.getElementById('amrdot').className = "badge badge-stable";
    document.getElementById('akbrdot').className =  "badge badge-stable";
    document.getElementById('anthdot').className = "badge badge-stable";
}
function handleTweets(tweets){
    var x = tweets.length;
    
    var amarCount = 0;
    var akbarCount = 0;
    var anthonyCount = 0;
    
    var amarScore = 0;
    var akbarScore = 0;
    var anthonyScore = 0;
    
    
    
   // alert("No. of tweets" + x);
    var n = 0;
    var element = document.getElementById('example1');
    
    var html = '<ul>';
    
    while(n < x) {
        
      html += '<li>' + tweets[n] + '</li>';
        //alert(tweets[n]);
        
        var twit = tweets[n].toLowerCase();
        
        if(twit.indexOf('#amar') != -1){
            
            if(twit.indexOf('like') != -1){
                amarScore = amarScore+5; 
            }else if(twit.indexOf('ok') != -1){
            }else if(twit.indexOf('bad') != -1){
                amarScore = amarScore-5;
            }
            
         amarCount++; 
        }else if(twit.indexOf('#akbar') != -1){
          if(twit.indexOf('like') != -1){
                akbarScore = akbarScore+5; 
            }else if(twit.indexOf('ok') != -1){
            }else if(twit.indexOf('bad') != -1){
                akbarScore = akbarScore-5;
            }
    
         akbarCount++; 
        } else if(twit.indexOf('#anthony') != -1){
      
            
                    if(twit.indexOf('like') != -1){
                anthonyScore = anthonyScore+5; 
            }else if(twit.indexOf('ok') != -1){
            }else if(twit.indexOf('bad') != -1){
                anthonyScore = anthonyScore-5;
            }
    
            
            anthonyCount++; 
        }
        
       n++;
    }
    html += '</ul>';
//    alert("Amar Count" + amarCount);
//    alert("Akbar Count" + akbarCount);
//    alert("Anthony Count" + anthonyCount);

    
//    alert("Amar score" + amarScore);
//    alert("Akbar score" + akbarScore);
//    alert("Anthony score" + anthonyScore);
   var relevency = (amarScore + akbarScore + anthonyScore)/3;
    if(null != relevency){
    relevency = Math.ceil(relevency);
    }
    document.getElementById('amar_id').value = amarScore;
    document.getElementById('akbar_id').value =  akbarScore;
    document.getElementById('anthony_id').value = anthonyScore;
    document.getElementById('final_weightage').value = relevency;
    
    if(amarScore <0)
        document.getElementById('amrdot').className = "badge badge-assertive";
    else if (amarScore == 0)
        document.getElementById('amrdot').className = "badge badge-energized";
    else if (amarScore > 0)
        document.getElementById('amrdot').className = "badge badge-balanced";
    
    
    if(akbarScore <0)
        document.getElementById('akbrdot').className =  "badge badge-assertive";
    else if (akbarScore == 0)
        document.getElementById('akbrdot').className =  "badge badge-energized";
    else if (akbarScore > 0)
        document.getElementById('akbrdot').className =  "badge badge-balanced";
    
    
    if(anthonyScore <0)
        document.getElementById('anthdot').className = "badge badge-assertive";
    else if (anthonyScore == 0)
        document.getElementById('anthdot').className = "badge badge-energized";
    else if (anthonyScore > 0)
        document.getElementById('anthdot').className = "badge badge-balanced";
   
    //element.innerHTML = html;
}