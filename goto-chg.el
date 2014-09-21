<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: goto-chg.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="http://www.emacswiki.org/emacs?action=edit;id=goto-chg.el" />
<link type="text/css" rel="stylesheet" href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.0/css/bootstrap-combined.min.css" />
<link type="text/css" rel="stylesheet" href="/css/bootstrap.css" />
<meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: goto-chg.el" href="http://www.emacswiki.org/emacs?action=rss;rcidonly=goto-chg.el" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content"
      href="http://www.emacswiki.org/emacs/full.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content and diff"
      href="http://www.emacswiki.org/emacs/full-diff.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki including minor differences"
      href="http://www.emacswiki.org/emacs/minor-edits.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Changes for goto-chg.el only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=goto-chg.el" /><meta name="viewport" content="width=device-width" />
<script type="text/javascript" src="/outliner.0.5.0.62-toc.js"></script>
<script type="text/javascript">

  function addOnloadEvent(fnc) {
    if ( typeof window.addEventListener != "undefined" )
      window.addEventListener( "load", fnc, false );
    else if ( typeof window.attachEvent != "undefined" ) {
      window.attachEvent( "onload", fnc );
    }
    else {
      if ( window.onload != null ) {
	var oldOnload = window.onload;
	window.onload = function ( e ) {
	  oldOnload( e );
	  window[fnc]();
	};
      }
      else
	window.onload = fnc;
    }
  }

  var initToc=function() {

    var outline = HTML5Outline(document.body);
    if (outline.sections.length == 1) {
      outline.sections = outline.sections[0].sections;
    }

    if (outline.sections.length > 1
	|| outline.sections.length == 1
           && outline.sections[0].sections.length > 0) {

      var toc = document.getElementById('toc');

      if (!toc) {
	var divs = document.getElementsByTagName('div');
	for (var i = 0; i < divs.length; i++) {
	  if (divs[i].getAttribute('class') == 'toc') {
	    toc = divs[i];
	    break;
	  }
	}
      }

      if (!toc) {
	var h2 = document.getElementsByTagName('h2')[0];
	if (h2) {
	  toc = document.createElement('div');
	  toc.setAttribute('class', 'toc');
	  h2.parentNode.insertBefore(toc, h2);
	}
      }

      if (toc) {
        var html = outline.asHTML(true);
        toc.innerHTML = html;
      }
    }
  }

  addOnloadEvent(initToc);
  </script>

<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.0/js/bootstrap.min.js"></script>
<script src="http://emacswiki.org/emacs/emacs-bootstrap.js"></script>
<!--[if !(lt IE 8)]><!-->
   <script type="text/javascript">
     (function(){var e=document.createElement("script");e.type="text/javascript";e.async=true;e.src=document.location.protocol+"//d1agz031tafz8n.cloudfront.net/thedaywefightback.js/widget.min.js";var t=document.getElementsByTagName("script")[0];t.parentNode.insertBefore(e,t)})()
   </script>
<!--<![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head><body class="http://www.emacswiki.org/emacs"><div class="header"><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/%e7%b6%b2%e7%ab%99%e5%9c%b0%e5%9c%96">網站地圖</a> <a class="local" href="http://www.emacswiki.org/emacs/%e6%9c%80%e8%bf%91%e6%9b%b4%e6%96%b0">最近更新</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/%e6%95%99%e5%af%bc">教导</a> </span><h1><a title="Click to search for references to this page" rel="nofollow" href="http://www.emacswiki.org/emacs?search=%22goto-chg%5c.el%22">goto-chg.el</a></h1></div><div class="wrapper"><div class="content browse"><p class="download"><a href="http://www.emacswiki.org/emacs/download/goto-chg.el">Download</a></p><pre><span class="comment">;;; goto-chg.el --- goto last change</span>
<span class="comment">;;--------------------------------------------------------------------</span>
<span class="comment">;;</span>
<span class="comment">;; Copyright (C) 2002-2008,2013 David Andersson</span>
<span class="comment">;;</span>
<span class="comment">;; This program is free software; you can redistribute it and/or</span>
<span class="comment">;; modify it under the terms of the GNU General Public License as</span>
<span class="comment">;; published by the Free Software Foundation; either version 2 of</span>
<span class="comment">;; the License, or (at your option) any later version.</span>
<span class="comment">;;</span>
<span class="comment">;; This program is distributed in the hope that it will be</span>
<span class="comment">;; useful, but WITHOUT ANY WARRANTY; without even the implied</span>
<span class="comment">;; warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR</span>
<span class="comment">;; PURPOSE.  See the GNU General Public License for more details.</span>
<span class="comment">;;</span>
<span class="comment">;; You should have received a copy of the GNU General Public</span>
<span class="comment">;; License along with this program; if not, write to the Free</span>
<span class="comment">;; Software Foundation, Inc., 59 Temple Place, Suite 330, Boston,</span>
<span class="comment">;; MA 02111-1307 USA</span>
<span class="comment">;;</span>
<span class="comment">;;-------------------------------------------------------------------</span>
<span class="comment">;;</span>
<span class="comment">;; Author: David Andersson &lt;l.david.andersson(at)sverige.nu&gt;</span>
<span class="comment">;; Created: 16 May 2002</span>
<span class="comment">;; Version: 1.6</span>
<span class="comment">;; Keywords: convenience, matching</span>
<span class="comment">;;</span>
<span class="comment">;;; Commentary:</span>
<span class="comment">;;</span>
<span class="comment">;; Goto Last Change</span>
<span class="comment">;;</span>
<span class="comment">;; Goto the point of the most recent edit in the buffer.</span>
<span class="comment">;; When repeated, goto the second most recent edit, etc.</span>
<span class="comment">;; Negative argument, C-u -, for reverse direction.</span>
<span class="comment">;; Works by looking into buffer-undo-list to find points of edit.</span>
<span class="comment">;;</span>
<span class="comment">;; You would probably like to bind this command to a key.</span>
<span class="comment">;; For example in your ~/.emacs:</span>
<span class="comment">;;</span>
<span class="comment">;;   (<span class="keyword">require</span> '<span class="constant">goto-chg</span>)</span>
<span class="comment">;;</span>
<span class="comment">;;   (global-set-key [(control ?.)] 'goto-last-change)</span>
<span class="comment">;;   (global-set-key [(control ?,)] 'goto-last-change-reverse)</span>
<span class="comment">;;</span>
<span class="comment">;; Works with emacs-19.29, 19.31, 20.3, 20.7, 21.1, 21.4, 22.1 and 23.1</span>
<span class="comment">;; Works with XEmacs-20.4 and 21.4 (but see todo about `<span class="constant important">last-command</span>' below)</span>
<span class="comment">;;</span>
<span class="comment">;;--------------------------------------------------------------------</span>
<span class="comment">;; History</span>
<span class="comment">;;</span>
<span class="comment">;; Ver 1.6 2013-12-12 David Andersson</span>
<span class="comment">;;    Add keywords; Cleanup comments</span>
<span class="comment">;; Ver 1.5 2013-12-11 David Andersson</span>
<span class="comment">;;    Autoload and document `<span class="constant important">goto-last-change-reverse</span>'</span>
<span class="comment">;; Ver 1.4 2008-09-20 David Andersson</span>
<span class="comment">;;    Improved property change description; Update comments.</span>
<span class="comment">;; Ver 1.3 2007-03-14 David Andersson</span>
<span class="comment">;;    Added `<span class="constant important">goto-last-change-reverse</span>'</span>
<span class="comment">;; Ver 1.2 2003-04-06 David Andersson</span>
<span class="comment">;;    Don't let repeating error depthen glc-probe-depth.</span>
<span class="comment">;; Ver 1.1 2003-04-06 David Andersson</span>
<span class="comment">;;    Zero arg describe changes. Negative arg go back.</span>
<span class="comment">;;    Autoload. Remove message using nil in stead of an empty string.</span>
<span class="comment">;; Ver 1.0 2002-05-18 David Andersson</span>
<span class="comment">;;    Initial version</span>
<span class="comment">;;</span>
<span class="comment">;;--------------------------------------------------------------------</span>
<span class="comment">;;</span>
<span class="comment">;;todo: Rename <span class="string">"goto-chg.el"</span> -&gt; <span class="string">"gotochange.el"</span> or <span class="string">"goto-chgs"</span> ?</span>
<span class="comment">;;todo: Rename function goto-last-change -&gt; goto-last-edit ?</span>
<span class="comment">;;todo: Rename adjective <span class="string">"-last-"</span> -&gt; <span class="string">"-latest-"</span> or <span class="string">"-most-recent-"</span> ?</span>
<span class="comment">;;todo: There are some, maybe useful, funcs  for region undo </span>
<span class="comment">;;       in simple.el in emacs 20. Take a look.</span>
<span class="comment">;;todo: Add functionality to visit changed point in text order, not only in</span>
<span class="comment">;;        chronological order. (Naa, highlight-changes-mode does that).</span>
<span class="comment">;;todo: Inverse indication that a change has been saved or not</span>
<span class="comment">;;todo: Highlight the range of text involved in the last change?</span>
<span class="comment">;;todo: See session-jump-to-last-change in session.el?</span>
<span class="comment">;;todo: Unhide invisible text (e.g. outline mode) like isearch do.</span>
<span class="comment">;;todo: XEmacs sets last-command to `<span class="constant important">t</span>' after an error, so you cannot reverse</span>
<span class="comment">;;        after <span class="string">"No furter change info"</span>. Should we bother?</span>
<span class="comment">;;todo: Try distinguish <span class="string">"No further change info"</span> (end of truncated undo list)</span>
<span class="comment">;;        and <span class="string">"No further changes"</span> (end of a complete undo list).</span>
<span class="comment">;;</span>
<span class="comment">;;--------------------------------------------------------------------</span>

<span class="comment">;;; Code:</span>

(<span class="keyword">defvar</span> <span class="variable">glc-default-span</span> 8 <span class="string">"*goto-last-change don't visit the same point twice. glc-default-span tells how far around a visited point not to visit again."</span>)
(<span class="keyword">defvar</span> <span class="variable">glc-current-span</span> 8 <span class="string">"Internal for goto-last-change.\nA copy of glc-default-span or the ARG passed to goto-last-change."</span>)
(<span class="keyword">defvar</span> <span class="variable">glc-probe-depth</span> 0 <span class="string">"Internal for goto-last-change.\nIt is non-zero between successive goto-last-change."</span>)

<span class="comment">;;todo: Find begin and end of line, then use it somewhere</span>

(<span class="keyword">defun</span> <span class="function">glc-center-ellipsis</span> (str maxlen <span class="type">&amp;optional</span> ellipsis)
  <span class="string">"Truncate STRING in the middle to length MAXLEN.
If STRING is max MAXLEN just return the string.
Optional third argument is the replacement, which defaults to \"...\"."</span>
  (<span class="keyword elisp">if</span> (&lt;= (length str) maxlen)
      str
    <span class="comment">;; else</span>
    (<span class="keyword elisp">let</span>* ((lipsis (or ellipsis <span class="string">"..."</span>))
	   (i (/ (- maxlen (length lipsis)) 2)))
      (concat (substring str 0 i)
	      lipsis 
	      (substring str (- i))))))

(<span class="keyword">defun</span> <span class="function">glc-adjust-pos</span>2 (pos p1 p2 adj)
  <span class="comment">;; Helper function to glc-adjust-pos</span>
  <span class="comment">;; p1, p2: interval where an edit occured</span>
  <span class="comment">;; adj: amount of text added (positive) or removed (negativ) by the edit</span>
  <span class="comment">;; Return pos if well before p1, or pos+adj if well after p2, or nil if too close</span>
  (<span class="keyword elisp">cond</span> ((&lt;= pos (- p1 glc-current-span))
	 pos)
	((&gt; pos (+ p2 glc-current-span))
	 (+ pos adj))
	((zerop glc-current-span)
	 p1)
	(t
	 nil)))

(<span class="keyword">defun</span> <span class="function">glc-adjust-pos</span> (pos e)
  <span class="string">"Given POS, a buffer position before the edit E, compute and return
the \"same\" buffer position after E happened.
Exception: return nil if POS is closer than `<span class="constant important">glc-current-span</span>' to the edit E.
\nInsertion edits before POS returns a larger value.
Deletion edits before POS returns a smaller value.
\nThe edit E is an entry from the `<span class="constant important">buffer-undo-list</span>'. See for details."</span>
  (<span class="keyword elisp">cond</span> ((atom e)			<span class="comment">; nil==cmd boundary, or, num==changed pos</span>
	 pos)
	((numberp (car e))		<span class="comment">; (beg . end)==insertion</span>
	 (glc-adjust-pos2 pos (car e) (car e) (- (cdr e) (car e))))
	((stringp (car e))		<span class="comment">; (string . pos)==deletion</span>
	 (glc-adjust-pos2 pos (abs (cdr e)) (+ (abs (cdr e)) (length (car e))) (- (length (car e)))))
	((null (car e))			<span class="comment">; (nil prop val beg . end)==prop change</span>
	 (glc-adjust-pos2 pos (nth 3 e) (nthcdr 4 e) 0))
	(t				<span class="comment">; (marker . dist)==marker moved</span>
	 pos)))

<span class="comment">;; If recursive in stead of iterative (<span class="keyword elisp">while</span>), it tends to fill the call stack.</span>
<span class="comment">;; (Isn't it tail optimized?)</span>
(<span class="keyword">defun</span> <span class="function">glc-adjust-list</span> (r)
  <span class="string">"R is list of edit entries in chronological order.
Pick the point of the first edit entry and update that point with
the second, third, etc, edit entries. Return the final updated point,
or nil if the point was closer than `<span class="constant important">glc-current-span</span>' to some edit in R.
\nR is basically a reversed slice from the buffer-undo-list."</span>
  (<span class="keyword elisp">if</span> r
      <span class="comment">;; Get pos</span>
      (<span class="keyword elisp">let</span> ((pos (glc-get-pos (car r))))
	(setq r (cdr r))
	<span class="comment">;; Walk back in reverse list</span>
	(<span class="keyword elisp">while</span> (and r pos)
	  (setq pos (glc-adjust-pos pos (car r))
		r (cdr r)))
	pos)
    <span class="comment">;; else</span>
    nil))

(<span class="keyword">defun</span> <span class="function">glc-get-pos</span> (e)
  <span class="string">"If E represents an edit, return a position value in E, the position
where the edit took place. Return nil if E represents no real change.
\nE is an entry in the buffer-undo-list."</span>
  (<span class="keyword elisp">cond</span> ((numberp e) e)			<span class="comment">; num==changed position</span>
	((atom e) nil)			<span class="comment">; nil==command boundary</span>
	((numberp (car e)) (cdr e))	<span class="comment">; (beg . end)==insertion</span>
	((stringp (car e)) (abs (cdr e))) <span class="comment">; (string . pos)==deletion</span>
	((null (car e)) (nthcdr 4 e))	<span class="comment">; (nil ...)==text property change</span>
	((atom (car e)) nil)		<span class="comment">; (t ...)==file modification time</span>
	(t nil)))			<span class="comment">; (marker ...)==marker moved</span>

(<span class="keyword">defun</span> <span class="function">glc-get-descript</span> (e <span class="type">&amp;optional</span> n)
  <span class="string">"If E represents an edit, return a short string describing E.
Return nil if E represents no real change.
\nE is an entry in the buffer-undo-list."</span>
  (<span class="keyword elisp">let</span> ((nn (or (format <span class="string">"T-%d: "</span> n) <span class="string">""</span>)))
    (<span class="keyword elisp">cond</span> ((numberp e) <span class="string">"New position"</span>)	<span class="comment">; num==changed position</span>
	  ((atom e) nil)		<span class="comment">; nil==command boundary</span>
	  ((numberp (car e))		<span class="comment">; (beg . end)==insertion</span>
	   (<span class="keyword elisp">if</span> (and n (&lt; n 2))
	       (format <span class="string">"%sInserted %d chars \"%s\""</span> nn (- (cdr e) (car e)) 
		       (glc-center-ellipsis (buffer-substring (car e) (cdr e)) 60))
	     <span class="comment">;; else</span>
	     <span class="comment">;; An older insert. The inserted text cannot easily be computed.</span>
	     <span class="comment">;; Just show the char count.</span>
	     (format <span class="string">"%sInserted %d chars"</span> nn (- (cdr e) (car e)))))
	  ((stringp (car e))		<span class="comment">; (string . pos)==deletion</span>
	   (format <span class="string">"%sDeleted \"%s\""</span> nn (glc-center-ellipsis (car e) 60)))
	  ((null (car e))		<span class="comment">; (nil ...)==text property change</span>
	   (format <span class="string">"%sProperty change"</span> nn))
	  ((atom (car e)) nil)		<span class="comment">; (t ...)==file modification time</span>
	  (t nil))))			<span class="comment">; (marker ...)==marker moved</span>

(<span class="keyword">defun</span> <span class="function">glc-is-positionable</span> (e)
  <span class="string">"Return non-nil if E is an insertion, deletion or text property change.
\nE is an entry in the buffer-undo-list."</span>
  (and (not (numberp e)) (glc-get-pos e)))

(<span class="keyword">defun</span> <span class="function">glc-is-filetime</span> (e)
  <span class="string">"Return t if E indicates a buffer became \"modified\",
that is, it was previously saved or unchanged. Nil otherwise."</span>
  (and (listp e) (eq (car e) t)))

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">goto-last-change</span> (arg)
<span class="string">"Go to the point where the last edit was made in the current buffer.
Repeat the command to go to the second last edit, etc.
\nTo go back to more recent edit, the reverse of this command, use \\[<span class="constant important">goto-last-change-reverse</span>]
or precede this command with \\[<span class="constant important">universal-argument</span>] - (minus).
\nIt does not go to the same point twice even if there has been many edits
there. I call the minimal distance between distinguishable edits \"span\".
Set variable `<span class="constant important">glc-default-span</span>' to control how close is \"the same point\".
Default span is 8.
The span can be changed temporarily with \\[<span class="constant important">universal-argument</span>] right before \\[<span class="constant important">goto-last-change</span>]:
\\[<span class="constant important">universal-argument</span>] &lt;NUMBER&gt; set current span to that number,
\\[<span class="constant important">universal-argument</span>] (no number) multiplies span by 4, starting with default.
The so set span remains until it is changed again with \\[<span class="constant important">universal-argument</span>], or the consecutive
repetition of this command is ended by any other command.
\nWhen span is zero (i.e. \\[<span class="constant important">universal-argument</span>] 0) subsequent \\[<span class="constant important">goto-last-change</span>] visits each and
every point of edit and a message shows what change was made there.
In this case it may go to the same point twice.
\nThis command uses undo information. If undo is disabled, so is this command.
At times, when undo information becomes too large, the oldest information is
discarded. See variable `<span class="constant important">undo-limit</span>'."</span>
  (interactive <span class="string">"P"</span>)
  (<span class="keyword elisp">cond</span> ((not (eq this-command last-command))
	 <span class="comment">;; Start a glc sequence</span>
	 <span class="comment">;; Don't go to current point if last command was an obvious edit</span>
	 <span class="comment">;; (yank or self-insert, but not kill-region). Makes it easier to</span>
	 <span class="comment">;; jump back and forth when copying seleced lines.</span>
	 (setq glc-probe-depth (<span class="keyword elisp">if</span> (memq last-command '(yank self-insert-command)) 1 0)
	       glc-direction 1
	       glc-current-span glc-default-span)
	 (<span class="keyword elisp">if</span> (&lt; (prefix-numeric-value arg) 0)
	     (<span class="warning">error</span> <span class="string">"Negative arg: Cannot reverse as the first operation"</span>))))
  (<span class="keyword elisp">cond</span> ((null buffer-undo-list)
	 (<span class="warning">error</span> <span class="string">"Buffer has not been changed"</span>))
	((eq buffer-undo-list t)
	 (<span class="warning">error</span> <span class="string">"No change info (undo is disabled)"</span>)))
  (<span class="keyword elisp">cond</span> ((numberp arg)			<span class="comment">; Numeric arg sets span</span>
	 (setq glc-current-span (abs arg)))
	((consp arg)			<span class="comment">; C-u's multiply previous span by 4</span>
	 (setq glc-current-span (* (abs (car arg)) glc-default-span))
	 (message <span class="string">"Current span is %d chars"</span> glc-current-span))) <span class="comment">;todo: keep message with <span class="string">"waiting"</span> and <span class="string">"is saved"</span></span>
  (<span class="keyword elisp">cond</span> ((&lt; (prefix-numeric-value arg) 0)
	 (setq glc-direction -1))
	(t
	 (setq glc-direction 1)))
  (<span class="keyword elisp">let</span> (rev				<span class="comment">; Reversed (and filtered) undo list</span>
	pos				<span class="comment">; The pos we look for, nil until found</span>
	(n 0)				<span class="comment">; Steps in undo list (length of 'rev')</span>
	(l buffer-undo-list) 
	(passed-save-entry (not (buffer-modified-p)))
	(new-probe-depth glc-probe-depth))
    <span class="comment">;; Walk back and forth in the buffer-undo-list, each time one step deeper,</span>
    <span class="comment">;; until we can walk back the whole list with a 'pos' that is not coming</span>
    <span class="comment">;; too close to another edit.</span>
    (<span class="keyword elisp">while</span> (null pos)
      (setq new-probe-depth (+ new-probe-depth glc-direction))
      (<span class="keyword elisp">if</span> (&lt; glc-direction 0)
	  (setq rev ()
		n 0
		l buffer-undo-list
		passed-save-entry (not (buffer-modified-p))))
      (<span class="keyword elisp">if</span> (&lt; new-probe-depth 1)
	  (<span class="warning">error</span> <span class="string">"No later change info"</span>))
      (<span class="keyword elisp">if</span> (&gt; n 150)
	  (message <span class="string">"working..."</span>))
      <span class="comment">;; Walk forward in buffer-undo-list, glc-probe-depth steps.</span>
      <span class="comment">;; Build reverse list along the way</span>
      (<span class="keyword elisp">while</span> (&lt; n new-probe-depth)
	(<span class="keyword elisp">cond</span> ((null l)
	       <span class="comment">;(setq this-command t)	; Disrupt repeat sequence</span>
	       (<span class="warning">error</span> <span class="string">"No further change info"</span>))
	      ((glc-is-positionable (car l))
	       (setq n (1+ n)
		     rev (cons (car l) rev)))
	      ((or passed-save-entry (glc-is-filetime (car l)))
	       (setq passed-save-entry t)))
	(setq l (cdr l)))
      <span class="comment">;; Walk back in reverse list, from older to newer edits.</span>
      <span class="comment">;; Adjusting pos along the way.</span>
      (setq pos (glc-adjust-list rev)))
    <span class="comment">;; Found a place not previously visited, in 'pos'.</span>
    <span class="comment">;; (An error have been issued if nothing (more) found.)</span>
    (<span class="keyword elisp">if</span> (&gt; n 150)
	(message nil))			<span class="comment">; remove message <span class="string">"working..."</span></span>
    (<span class="keyword elisp">if</span> (and (= glc-current-span 0) (glc-get-descript (car rev) n))
	(message <span class="string">"%s"</span> (glc-get-descript (car rev) n))
      <span class="comment">;; else</span>
      (<span class="keyword elisp">if</span> passed-save-entry
	  (message <span class="string">"(This change is saved)"</span>)))
    (setq glc-probe-depth new-probe-depth)
    (goto-char pos)))

<span class="comment">;;;###<span class="warning">autoload</span></span>
(<span class="keyword">defun</span> <span class="function">goto-last-change-reverse</span> (arg)
  <span class="string">"Go back to more recent changes after \\[<span class="constant important">goto-last-change</span>] have been used.
See `<span class="constant important">goto-last-change</span>' for use of prefix argument."</span>
  (interactive <span class="string">"P"</span>)
  <span class="comment">;; Negate arg, all kinds</span>
  (<span class="keyword elisp">cond</span> ((eq arg nil)  (setq arg '-))
	((eq arg '-)   (setq arg nil))
	((listp arg)   (setq arg (list (- (car arg)))))
	(t (setq arg   (- arg))))
  <span class="comment">;; Make 'goto-last-change-reverse' look like 'goto-last-change'</span>
  (<span class="keyword elisp">cond</span> ((eq last-command this-command)
	 (setq last-command 'goto-last-change)))
  (setq this-command 'goto-last-change)
  <span class="comment">;; Call 'goto-last-change' to do the job</span>
  (goto-last-change arg))

(<span class="keyword">provide</span> '<span class="constant">goto-chg</span>)

<span class="comment">;;; goto-chg.el ends here</span></pre></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/%e7%b6%b2%e7%ab%99%e5%9c%b0%e5%9c%96">網站地圖</a> <a class="local" href="http://www.emacswiki.org/emacs/%e6%9c%80%e8%bf%91%e6%9b%b4%e6%96%b0">最近更新</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/%e6%95%99%e5%af%bc">教导</a> </span><span class="translation bar"><br />  <a class="translation new" rel="nofollow" href="http://www.emacswiki.org/emacs?action=translate;id=goto-chg.el;missing=de_es_fr_it_ja_ko_pt_ru_se_uk_zh">Add Translation</a></span><span class="edit bar"><br /> <a class="comment local edit" accesskey="c" href="http://www.emacswiki.org/emacs/Comments_on_goto-chg.el">讨论</a> <a class="edit" accesskey="e" title="Click to edit this page" rel="nofollow" href="http://www.emacswiki.org/emacs?action=edit;id=goto-chg.el">Edit this page</a> <a class="history" rel="nofollow" href="http://www.emacswiki.org/emacs?action=history;id=goto-chg.el">View other revisions</a> <a class="admin" rel="nofollow" href="http://www.emacswiki.org/emacs?action=admin;id=goto-chg.el">Administration</a></span><span class="time"><br /> Last edited 2013-12-28 14:59 UTC by <a class="author" title="c-4c25e755.021-165-73746f23.cust.bredbandsbolaget.se" href="http://www.emacswiki.org/emacs/DavidAndersson">DavidAndersson</a> <a class="diff" rel="nofollow" href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=goto-chg.el">(diff)</a></span><form method="get" action="http://www.emacswiki.org/cgi-bin/emacs" enctype="multipart/form-data" accept-charset="utf-8" class="search">
<p><label for="search">Search:</label> <input type="text" name="search"  size="20" accesskey="f" id="search" /> <label for="searchlang">Language:</label> <input type="text" name="lang"  size="10" id="searchlang" /> <input type="submit" name="dosearch" value="Go!" /></p></form><div style="float:right; margin-left:1ex;">
<!-- Creative Commons License -->
<a class="licence" href="http://creativecommons.org/licenses/GPL/2.0/"><img alt="CC-GNU GPL" style="border:none" src="/pics/cc-GPL-a.png" /></a>
<!-- /Creative Commons License -->
</div>

<!--
<rdf:RDF xmlns="http://web.resource.org/cc/"
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<Work rdf:about="">
   <license rdf:resource="http://creativecommons.org/licenses/GPL/2.0/" />
  <dc:type rdf:resource="http://purl.org/dc/dcmitype/Software" />
</Work>

<License rdf:about="http://creativecommons.org/licenses/GPL/2.0/">
   <permits rdf:resource="http://web.resource.org/cc/Reproduction" />
   <permits rdf:resource="http://web.resource.org/cc/Distribution" />
   <requires rdf:resource="http://web.resource.org/cc/Notice" />
   <permits rdf:resource="http://web.resource.org/cc/DerivativeWorks" />
   <requires rdf:resource="http://web.resource.org/cc/ShareAlike" />
   <requires rdf:resource="http://web.resource.org/cc/SourceCode" />
</License>
</rdf:RDF>
-->

<p class="legal">
This work is licensed to you under version 2 of the
<a href="http://www.gnu.org/">GNU</a> <a href="/GPL">General Public License</a>.
Alternatively, you may choose to receive this work under any other
license that grants the right to use, copy, modify, and/or distribute
the work, as long as that license imposes the restriction that
derivative works have to grant the same rights and impose the same
restriction. For example, you may choose to receive this work under
the
<a href="http://www.gnu.org/">GNU</a>
<a href="/FDL">Free Documentation License</a>, the
<a href="http://creativecommons.org/">CreativeCommons</a>
<a href="http://creativecommons.org/licenses/sa/1.0/">ShareAlike</a>
License, the XEmacs manual license, or
<a href="/OLD">similar licenses</a>.
</p>
</div>
</body>
</html>
