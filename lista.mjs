const alist = [1,2,3];

function list_count (some_other_list) {
	var count = 0;
	for (const i of some_other_list) {
		count++;
	}
	return count; 
}
const el_total = list_count(alist);
console.log(el_total);