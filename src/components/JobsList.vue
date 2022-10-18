<template>
  <div class="job-list">
    <div class="sub-header">
      <h2>{{ namePage }}</h2>
      <div>Ordered by {{ order }}</div>
    </div>

    <ul>
      <TransitionGroup name="flip-list">
        <li v-for="job in orderedJobs" :key="job.id">
          <h2>{{ job.title }} in {{ job.location }}</h2>
          <div class="salary">
            <img
              src="https://img.icons8.com/external-vitaliy-gorbachev-flat-vitaly-gorbachev/58/000000/external-ruble-currency-vitaliy-gorbachev-flat-vitaly-gorbachev-1.png"
              alt="rubl icon"
            />
            <p>{{ job.salary }} Рублей</p>
          </div>
          <div class="description">
            <p>
              Lorem ipsum dolor sit amet, consecrate adipisicing elit. Alias
              aspernatur, delectus doloremque error est explicabo fugiat iusto
              laborum quos repudiandae. Alias animi blanditiis delectus eligendi
              enim ipsa nobis placeat quo.
            </p>
          </div>
        </li>
      </TransitionGroup>
    </ul>
  </div>
</template>

<script lang="ts">
import Job from "@/types/job";
import OrderTerm from "@/types/OrderTerm";
import { computed, defineComponent, PropType } from "vue";

export default defineComponent({
  name: "JobsList",
  props: {
    jobs: {
      required: true,
      type: Array as PropType<Job[]>,
    },
    namePage: {
      type: String,
      default: () => {
        return "default name page";
      },
    },
    order: {
      required: true,
      type: String as PropType<OrderTerm>,
    },
  },
  setup(props) {
    const orderedJobs = computed(() => {
      return [...props.jobs].sort((a: Job, b: Job) => {
        return a[props.order] > b[props.order] ? 1 : -1;
      });
    });

    return {
      orderedJobs,
    };
  },
});
</script>

<style scoped>
.sub-header {
  display: flex;
  flex-direction: column;
  align-items: center;
}

.job-list {
  max-width: 960px;
  margin: 40px auto;
}

.job-list ul {
  padding: 0;
}

.job-list li {
  list-style-type: none;
  background: white;
  padding: 16px;
  margin: 16px 0;
  border-radius: 4px;
}

.job-list h2 {
  margin: 0 0 10px;
  text-transform: capitalize;
}

.salary {
  display: flex;
}

.salary img {
  width: 30px;
}

.salary p {
  color: #17bf66;
  font-weight: bold;
  margin: 10px 4px;
}

.flip-list-move {
  transition: transform 0.8s ease;
}
</style>
